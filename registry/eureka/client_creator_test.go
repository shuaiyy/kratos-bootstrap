package eureka

import (
	"testing"

	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"
	"github.com/stretchr/testify/assert"
)

func TestNewEurekaRegistry(t *testing.T) {
	cfg := conf.Registry{
		Eureka: &conf.Registry_Eureka{
			Endpoints: []string{"https://127.0.0.1:18761"},
		},
	}

	reg := NewRegistry(&cfg)
	assert.NotNil(t, reg)
}
