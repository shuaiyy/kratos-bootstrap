package consul

import (
	"testing"

	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"
	"github.com/stretchr/testify/assert"
)

func TestNewConsulRegistry(t *testing.T) {
	cfg := conf.Registry{
		Consul: &conf.Registry_Consul{
			Scheme:      "http",
			Address:     "localhost:8500",
			HealthCheck: false,
		},
	}

	reg := NewRegistry(&cfg)
	assert.NotNil(t, reg)
}
