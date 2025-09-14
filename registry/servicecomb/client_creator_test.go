package servicecomb

import (
	"testing"

	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"
	"github.com/stretchr/testify/assert"
)

func TestNewServicecombRegistry(t *testing.T) {
	cfg := conf.Registry{
		Servicecomb: &conf.Registry_Servicecomb{
			Endpoints: []string{"127.0.0.1:30100"},
		},
	}

	reg := NewRegistry(&cfg)
	assert.NotNil(t, reg)
}
