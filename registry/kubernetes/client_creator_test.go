package kubernetes

import (
	"github.com/stretchr/testify/assert"
	conf "github.com/shuaiyy/kratos-bootstrap/api/gen/go/conf/v1"
	"testing"
)

func TestNewKubernetesRegistry(t *testing.T) {
	var cfg conf.Registry
	reg := NewRegistry(&cfg)
	assert.NotNil(t, reg)
}
