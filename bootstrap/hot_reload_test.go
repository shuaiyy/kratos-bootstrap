package bootstrap

import (
	"os"
	"strconv"
	"testing"
	"time"
	
	"github.com/go-kratos/kratos/v2/config"
	fileKratos "github.com/go-kratos/kratos/v2/config/file"
)

// TestHotReloadInit 测试热加载初始化
func TestHotReloadInit(t *testing.T) {
	// 测试环境变量设置
	os.Setenv("CONFIG_HOT_RELOAD", "true")
	defer os.Unsetenv("CONFIG_HOT_RELOAD")
	
	// 重新初始化
	if hotReloadEnv := os.Getenv("CONFIG_HOT_RELOAD"); hotReloadEnv != "" {
		if enabled, err := strconv.ParseBool(hotReloadEnv); err == nil {
			hotReloadEnabled = enabled
		}
	}
	
	if !IsHotReloadEnabled() {
		t.Error("Hot reload should be enabled when CONFIG_HOT_RELOAD=true")
	}
}

// TestRegisterReloadCallback 测试注册回调函数
func TestRegisterReloadCallback(t *testing.T) {
	callbackCalled := false
	
	RegisterReloadCallback(func() {
		callbackCalled = true
	})
	
	// 模拟配置重载
	if len(reloadCallbacks) == 0 {
		t.Error("Callback should be registered")
	}
	
	// 执行回调
	for _, callback := range reloadCallbacks {
		if callback != nil {
			callback()
		}
	}
	
	// 等待异步回调执行
	time.Sleep(100 * time.Millisecond)
	
	if !callbackCalled {
		t.Error("Callback should have been called")
	}
}

// TestGetConfigThreadSafety 测试配置获取的线程安全性
func TestGetConfigThreadSafety(t *testing.T) {
	// 注册一个测试配置
	type TestConfig struct {
		Value string `json:"value"`
	}
	
	testConfig := &TestConfig{Value: "initial"}
	RegisterConfig(testConfig)
	
	// 并发访问配置
	done := make(chan bool)
	
	for i := 0; i < 10; i++ {
		go func() {
			defer func() { done <- true }()
			config := GetConfig[TestConfig]()
			if config == nil {
				t.Error("Config should not be nil")
			}
		}()
	}
	
	// 等待所有goroutine完成
	for i := 0; i < 10; i++ {
		<-done
	}
}

// TestStopConfigWatch 测试停止配置监听
func TestStopConfigWatch(t *testing.T) {
	// 创建一个mock配置提供者
	cfg := config.New(
		config.WithSource(
			fileKratos.NewSource("./test_config.yaml"),
		),
	)
	
	configMutex.Lock()
	configProvider = cfg
	configMutex.Unlock()
	
	// 测试停止监听
	StopConfigWatch()
	
	if configProvider != nil {
		t.Error("Config provider should be nil after stopping watch")
	}
}