module github.com/shuaiyy/kratos-bootstrap/remoteconfig/polaris

go 1.24.6

replace (
	github.com/armon/go-metrics => github.com/hashicorp/go-metrics v0.4.1

	github.com/shuaiyy/kratos-bootstrap/api => ../../api
)

require (
	github.com/go-kratos/kratos/v2 v2.9.1
	github.com/shuaiyy/kratos-bootstrap/api v0.0.1
)

require (
	dario.cat/mergo v1.0.2 // indirect
	github.com/google/go-cmp v0.7.0 // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/rogpeppe/go-internal v1.13.1 // indirect
	golang.org/x/sync v0.14.0 // indirect
	google.golang.org/protobuf v1.36.9 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
