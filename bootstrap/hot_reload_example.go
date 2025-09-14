package bootstrap

import (
	"fmt"
	"time"
	
	"github.com/go-kratos/kratos/v2/log"
)

// ExampleUsage 演示如何使用热加载功能
func ExampleUsage() {
	// 1. 通过环境变量启用热加载
	// export CONFIG_HOT_RELOAD=true
	
	// 2. 注册配置重载回调
	RegisterReloadCallback(func() {
		fmt.Println("Configuration has been reloaded!")
		// 在这里可以执行配置更新后的逻辑
		// 比如重新连接数据库、更新缓存配置等
	})
	
	// 3. 加载配置（会自动启动热加载监听器）
	// err := LoadBootstrapConfig("./configs")
	// if err != nil {
	//     log.Fatal("Failed to load configuration:", err)
	// }
	
	// 4. 使用配置
	// config := GetBootstrapConfig()
	// fmt.Printf("Server config: %+v\n", config.Server)
	
	// 5. 监控配置状态
	ticker := time.NewTicker(10 * time.Second)
	defer ticker.Stop()
	
	for {
		select {
		case <-ticker.C:
			if IsHotReloadEnabled() {
				log.Info("Hot reload is active, monitoring configuration changes...")
			} else {
				log.Info("Hot reload is disabled")
			}
		}
	}
}

// BusinessConfigReloadHandler 业务配置重载处理器示例
func BusinessConfigReloadHandler() {
	// 注册多个回调处理器
	RegisterReloadCallback(func() {
		log.Info("Reloading database connections...")
		// 重新配置数据库连接
	})
	
	RegisterReloadCallback(func() {
		log.Info("Reloading cache settings...")
		// 重新配置缓存设置
	})
	
	RegisterReloadCallback(func() {
		log.Info("Reloading service discovery...")
		// 重新配置服务发现
	})
}