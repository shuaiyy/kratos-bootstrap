package bootstrap

import (
	kRegistry "github.com/go-kratos/kratos/v2/registry"
	"github.com/shuaiyy/kratos-bootstrap/registry"

	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"

	_ "github.com/shuaiyy/kratos-bootstrap/registry/consul"
	_ "github.com/shuaiyy/kratos-bootstrap/registry/etcd"
	_ "github.com/shuaiyy/kratos-bootstrap/registry/eureka"

	//_ "github.com/shuaiyy/kratos-bootstrap/registry/kubernetes"
	_ "github.com/shuaiyy/kratos-bootstrap/registry/nacos"
	_ "github.com/shuaiyy/kratos-bootstrap/registry/servicecomb"
	_ "github.com/shuaiyy/kratos-bootstrap/registry/zookeeper"
)

// NewRegistry 创建一个注册客户端
func NewRegistry(cfg *conf.Registry) kRegistry.Registrar {
	if cfg == nil {
		return nil
	}

	if cfg.GetType() == "" {
		return nil
	}

	creator := registry.GetRegistrarCreator(cfg.GetType())
	if creator == nil {
		panic("registrar creator not found:" + cfg.GetType())
		return nil
	}

	return creator(cfg)
}

// NewDiscovery 创建一个发现客户端
func NewDiscovery(cfg *conf.Registry) kRegistry.Discovery {
	if cfg == nil {
		return nil
	}

	if cfg.GetType() == "" {
		return nil
	}

	creator := registry.GetDiscoveryCreator(cfg.GetType())
	if creator == nil {
		panic("discovery creator not found:" + cfg.GetType())
		return nil
	}

	return creator(cfg)
}
