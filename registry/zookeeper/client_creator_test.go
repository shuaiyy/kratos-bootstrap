package zookeeper

import (
	"testing"

	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"
	"github.com/stretchr/testify/assert"
)

func TestNewZooKeeperRegistry(t *testing.T) {
	cfg := conf.Registry{
		Zookeeper: &conf.Registry_ZooKeeper{
			Endpoints: []string{"127.0.0.1:2181"},
		},
	}

	reg := NewRegistry(&cfg)
	assert.NotNil(t, reg)
}
