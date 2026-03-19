module github.com/zbl-jerry/kratos-bootstrap/registry/servicecomb

go 1.24.6

replace (
	github.com/armon/go-metrics => github.com/hashicorp/go-metrics v0.4.1

	github.com/zbl-jerry/kratos-bootstrap/api => ../../api
	github.com/zbl-jerry/kratos-bootstrap/registry => ../
)

require (
	github.com/go-chassis/cari v0.9.0
	github.com/go-chassis/sc-client v0.7.0
	github.com/go-kratos/kratos/v2 v2.9.1
	github.com/gofrs/uuid v4.4.0+incompatible
	github.com/zbl-jerry/kratos-bootstrap/api v0.0.2
	github.com/zbl-jerry/kratos-bootstrap/registry v0.0.2
	github.com/stretchr/testify v1.11.1
)

require (
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/deckarep/golang-set v1.8.0 // indirect
	github.com/go-chassis/foundation v0.4.0 // indirect
	github.com/go-chassis/openlog v1.1.3 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/gorilla/websocket v1.5.4-0.20250319132907-e064f32e3674 // indirect
	github.com/karlseguin/ccache/v2 v2.0.8 // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/patrickmn/go-cache v2.1.0+incompatible // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	golang.org/x/net v0.44.0 // indirect
	golang.org/x/sync v0.17.0 // indirect
	google.golang.org/protobuf v1.36.9 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
