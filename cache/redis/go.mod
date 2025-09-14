module github.com/shuaiyy/kratos-bootstrap/cache/redis

go 1.24.6

replace github.com/shuaiyy/kratos-bootstrap/api => ../../api

require (
	github.com/go-kratos/kratos/v2 v2.9.1
	github.com/redis/go-redis/extra/redisotel/v9 v9.14.0
	github.com/redis/go-redis/v9 v9.14.0
	github.com/shuaiyy/kratos-bootstrap/api v0.0.1
)

require (
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/redis/go-redis/extra/rediscmd/v9 v9.14.0 // indirect
	go.opentelemetry.io/auto/sdk v1.2.0 // indirect
	go.opentelemetry.io/otel v1.38.0 // indirect
	go.opentelemetry.io/otel/metric v1.38.0 // indirect
	go.opentelemetry.io/otel/trace v1.38.0 // indirect
	google.golang.org/protobuf v1.36.9 // indirect
)
