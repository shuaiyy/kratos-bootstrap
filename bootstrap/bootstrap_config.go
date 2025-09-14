package bootstrap

import (
	"os"
	"strconv"
	"sync"

	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"
	"github.com/go-kratos/kratos/v2/config"
	"github.com/go-kratos/kratos/v2/log"
)

var (
	configList   []interface{}
	commonConfig = &conf.Bootstrap{}
	
	// 热加载相关变量
	hotReloadEnabled bool
	configProvider   config.Config
	configMutex      sync.RWMutex
	reloadCallbacks  []func()
)

func GetBootstrapConfig() *conf.Bootstrap {
	configMutex.RLock()
	defer configMutex.RUnlock()
	return commonConfig
}

// init 初始化热加载设置
func init() {
	// 检查环境变量 CONFIG_HOT_RELOAD 是否启用热加载
	if hotReloadEnv := os.Getenv("CONFIG_HOT_RELOAD"); hotReloadEnv != "" {
		if enabled, err := strconv.ParseBool(hotReloadEnv); err == nil {
			hotReloadEnabled = enabled
		}
	}
}

// GetConfig 获取指定类型的配置，支持泛型
// 如果获取不存在，则返回nil指针
func GetConfig[T any]() *T {
	configMutex.RLock()
	defer configMutex.RUnlock()
	
	for _, config := range configList {
		if c, ok := config.(*T); ok {
			return c
		}
	}
	return nil
}

// RegisterConfig 注册配置
func RegisterConfig(c interface{}) {
	configMutex.Lock()
	defer configMutex.Unlock()
	
	initBootstrapConfig()
	configList = append(configList, c)
}

// reloadConfigurations 重新加载配置
func reloadConfigurations(cfg config.Config) {
	configMutex.Lock()
	defer configMutex.Unlock()

	// 重新扫描配置
	for _, c := range configList {
		if err := cfg.Scan(c); err != nil {
			log.Errorf("Failed to reload configuration: %v", err)
			return
		}
	}

	log.Info("Configuration reloaded successfully")

	// 执行回调函数
	for _, callback := range reloadCallbacks {
		if callback != nil {
			go callback() // 异步执行回调，避免阻塞
		}
	}
}

// RegisterReloadCallback 注册配置重载回调函数
func RegisterReloadCallback(callback func()) {
	if callback == nil {
		return
	}
	
	configMutex.Lock()
	defer configMutex.Unlock()
	
	reloadCallbacks = append(reloadCallbacks, callback)
}

// IsHotReloadEnabled 检查是否启用了热加载
func IsHotReloadEnabled() bool {
	return hotReloadEnabled
}

// StopConfigWatch 停止配置监听（用于优雅关闭）
func StopConfigWatch() {
	configMutex.Lock()
	defer configMutex.Unlock()
	
	if configProvider != nil {
		if err := configProvider.Close(); err != nil {
			log.Errorf("Failed to close config provider: %v", err)
		}
		configProvider = nil
	}
}

func initBootstrapConfig() {
	if len(configList) > 0 {
		return
	}

	configList = append(configList, commonConfig)

	if commonConfig.Server == nil {
		commonConfig.Server = &conf.Server{}
		configList = append(configList, commonConfig.Server)
	}

	if commonConfig.Client == nil {
		commonConfig.Client = &conf.Client{}
		configList = append(configList, commonConfig.Client)
	}

	if commonConfig.Data == nil {
		commonConfig.Data = &conf.Data{}
		configList = append(configList, commonConfig.Data)
	}

	if commonConfig.Trace == nil {
		commonConfig.Trace = &conf.Tracer{}
		configList = append(configList, commonConfig.Trace)
	}

	if commonConfig.Logger == nil {
		commonConfig.Logger = &conf.Logger{}
		configList = append(configList, commonConfig.Logger)
	}

	if commonConfig.Registry == nil {
		commonConfig.Registry = &conf.Registry{}
		configList = append(configList, commonConfig.Registry)
	}

	if commonConfig.Oss == nil {
		commonConfig.Oss = &conf.OSS{}
		configList = append(configList, commonConfig.Oss)
	}

	if commonConfig.Notify == nil {
		commonConfig.Notify = &conf.Notification{}
		configList = append(configList, commonConfig.Notify)
	}
}
