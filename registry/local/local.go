package local

import (
	"context"
	"sync"

	"github.com/go-kratos/kratos/v2/registry"
	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"
	r "github.com/shuaiyy/kratos-bootstrap/registry"
)

func init() {
	r.RegisterRegistrarCreator("local", func(c *conf.Registry) registry.Registrar {
		return NewMemoryRegistry()
	})
	r.RegisterDiscoveryCreator("local", func(c *conf.Registry) registry.Discovery {
		return NewMemoryRegistry().(registry.Discovery)
	})
}

type memoryRegistry struct {
	mu       sync.RWMutex
	services map[string][]*registry.ServiceInstance
}

func NewMemoryRegistry() registry.Registrar {
	return &memoryRegistry{
		services: make(map[string][]*registry.ServiceInstance),
	}
}

func (r *memoryRegistry) Register(ctx context.Context, svc *registry.ServiceInstance) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	r.services[svc.Name] = append(r.services[svc.Name], svc)
	return nil
}

func (r *memoryRegistry) Deregister(ctx context.Context, svc *registry.ServiceInstance) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	list := r.services[svc.Name]
	newList := make([]*registry.ServiceInstance, 0, len(list))
	for _, s := range list {
		if s.ID != svc.ID {
			newList = append(newList, s)
		}
	}
	r.services[svc.Name] = newList
	return nil
}

func (r *memoryRegistry) GetService(ctx context.Context, name string) ([]*registry.ServiceInstance, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	return r.services[name], nil
}

func (r *memoryRegistry) Watch(ctx context.Context, name string) (registry.Watcher, error) {
	r.mu.RLock()
	instances := make([]*registry.ServiceInstance, len(r.services[name]))
	copy(instances, r.services[name])
	r.mu.RUnlock()
	return &noopWatcher{instances: instances}, nil
}

// 一个简单的 watcher
type noopWatcher struct {
	instances []*registry.ServiceInstance
}

func (w *noopWatcher) Next() ([]*registry.ServiceInstance, error) {
	return w.instances, nil
}

func (w *noopWatcher) Stop() error {
	return nil
}
