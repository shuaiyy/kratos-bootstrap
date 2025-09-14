# 配置热加载功能

## 概述

该功能为 kratos-bootstrap 框架添加了动态配置热加载能力，使用环境变量开关控制，基于 Kratos 内置的配置监听机制实现。

## 功能特性

- ✅ 环境变量开关控制 (`CONFIG_HOT_RELOAD`)
- ✅ 基于 Kratos config 的热加载机制
- ✅ 线程安全的配置访问
- ✅ 回调机制支持业务逻辑响应配置变更
- ✅ 优雅的资源清理和关闭

## 使用方法

### 1. 启用热加载

通过设置环境变量启用配置热加载：

```bash
export CONFIG_HOT_RELOAD=true
```

或在应用启动时设置：

```bash
CONFIG_HOT_RELOAD=true ./your-app
```

### 2. 基本用法

```go
package main

import (
    "github.com/shuaiyy/kratos-bootstrap/bootstrap"
)

func main() {
    // 加载配置（如果环境变量启用，会自动开启热加载）
    err := bootstrap.LoadBootstrapConfig("./configs")
    if err != nil {
        panic(err)
    }
    
    // 检查热加载状态
    if bootstrap.IsHotReloadEnabled() {
        fmt.Println("Hot reload is enabled")
    }
    
    // 获取配置（线程安全）
    config := bootstrap.GetBootstrapConfig()
    
    // 使用泛型获取特定类型配置
    serverConfig := bootstrap.GetConfig[conf.Server]()
}
```

### 3. 注册配置变更回调

```go
func main() {
    // 注册配置重载回调
    bootstrap.RegisterReloadCallback(func() {
        fmt.Println("Configuration reloaded!")
        // 在这里处理配置更新后的逻辑
        reloadDatabaseConnections()
        refreshCacheSettings()
        updateServiceRegistry()
    })
    
    // 可以注册多个回调
    bootstrap.RegisterReloadCallback(func() {
        log.Info("Notifying other components about config change")
    })
}

func reloadDatabaseConnections() {
    // 重新配置数据库连接
    dbConfig := bootstrap.GetConfig[conf.Data]()
    // ... 重新连接数据库
}

func refreshCacheSettings() {
    // 刷新缓存设置
    // ...
}
```

### 4. 优雅关闭

```go
func main() {
    // 应用关闭时停止配置监听
    defer bootstrap.StopConfigWatch()
    
    // 应用逻辑...
}
```

## API 参考

### 环境变量

| 变量名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| `CONFIG_HOT_RELOAD` | boolean | `false` | 是否启用配置热加载 |

### 函数

#### `GetBootstrapConfig() *conf.Bootstrap`
获取主配置对象，线程安全。

#### `GetConfig[T any]() *T`
获取指定类型的配置，支持泛型，线程安全。如果配置不存在返回 `nil`。

#### `RegisterReloadCallback(callback func())`
注册配置重载回调函数，当配置发生变更时会异步调用。

#### `IsHotReloadEnabled() bool`
检查是否启用了配置热加载。

#### `StopConfigWatch()`
停止配置监听，用于优雅关闭。

## 工作原理

1. **初始化阶段**：检查 `CONFIG_HOT_RELOAD` 环境变量
2. **配置加载**：调用 `LoadBootstrapConfig` 时，如果热加载开启：
   - 启动 goroutine 监听配置文件变化
   - 使用 Kratos `config.Watch` API 监听变更
3. **配置变更**：当配置文件发生变化时：
   - 自动重新加载所有注册的配置对象
   - 异步执行所有注册的回调函数
4. **线程安全**：所有配置访问都使用读写锁保护

## 注意事项

1. **性能影响**：热加载会启动额外的 goroutine 监听文件变化
2. **回调执行**：回调函数是异步执行的，不会阻塞配置重载过程
3. **错误处理**：配置重载失败时会记录错误日志但不会中断应用
4. **资源清理**：应用关闭时记得调用 `StopConfigWatch()`

## 示例场景

### 数据库配置动态更新

```go
bootstrap.RegisterReloadCallback(func() {
    dbConfig := bootstrap.GetConfig[conf.Data]()
    if dbConfig != nil && dbConfig.Database != nil {
        // 重新建立数据库连接池
        pool.Reconfigure(dbConfig.Database)
        log.Info("Database configuration reloaded")
    }
})
```

### 服务发现配置更新

```go
bootstrap.RegisterReloadCallback(func() {
    registryConfig := bootstrap.GetConfig[conf.Registry]()
    if registryConfig != nil {
        // 更新服务发现配置
        registry.UpdateConfig(registryConfig)
        log.Info("Registry configuration reloaded")  
    }
})
```

### 日志级别动态调整

```go
bootstrap.RegisterReloadCallback(func() {
    logConfig := bootstrap.GetConfig[conf.Logger]()
    if logConfig != nil {
        // 动态调整日志级别
        log.SetLevel(logConfig.Level)
        log.Info("Logger configuration reloaded")
    }
})
```

## 测试

运行测试验证功能：

```bash
go test -v -run ".*HotReload.*"
```

测试覆盖：
- 环境变量初始化
- 回调函数注册和执行
- 线程安全性
- 资源清理