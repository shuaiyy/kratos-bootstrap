module github.com/shuaiyy/kratos-bootstrap/logger

go 1.24.6

replace (
	github.com/armon/go-metrics => github.com/hashicorp/go-metrics v0.4.1
	github.com/imdario/mergo => dario.cat/mergo v0.3.16

	github.com/shuaiyy/kratos-bootstrap/api => ../api
	github.com/shuaiyy/kratos-bootstrap/utils => ../utils
)

require (
	github.com/go-kratos/kratos/contrib/log/aliyun/v2 v2.0.0-20250912104010-25b6c0fb9f38
	github.com/go-kratos/kratos/contrib/log/fluent/v2 v2.0.0-20250912104010-25b6c0fb9f38
	github.com/go-kratos/kratos/contrib/log/logrus/v2 v2.0.0-20250912104010-25b6c0fb9f38
	github.com/go-kratos/kratos/contrib/log/tencent/v2 v2.0.0-20250912104010-25b6c0fb9f38
	github.com/go-kratos/kratos/contrib/log/zap/v2 v2.0.0-20250912104010-25b6c0fb9f38
	github.com/go-kratos/kratos/v2 v2.9.1
	github.com/shuaiyy/kratos-bootstrap/api v0.0.1
	github.com/shuaiyy/kratos-bootstrap/utils v0.0.1
	github.com/sirupsen/logrus v1.9.3
	go.uber.org/zap v1.27.0
	gopkg.in/natefinch/lumberjack.v2 v2.2.1
)

require (
	cloud.google.com/go/compute/metadata v0.8.0 // indirect
	github.com/alibabacloud-go/darabonba-openapi/v2 v2.1.12 // indirect
	github.com/alibabacloud-go/endpoint-util v1.1.1 // indirect
	github.com/alibabacloud-go/openapi-util v0.1.1 // indirect
	github.com/aliyun/aliyun-log-go-sdk v0.1.108 // indirect
	github.com/aliyun/credentials-go v1.4.7 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cenkalti/backoff v2.2.1+incompatible // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/dennwc/varint v1.0.0 // indirect
	github.com/fluent/fluent-logger-golang v1.10.1 // indirect
	github.com/frankban/quicktest v1.14.6 // indirect
	github.com/go-kit/kit v0.13.0 // indirect
	github.com/go-kit/log v0.2.1 // indirect
	github.com/go-kratos/aegis v0.2.0 // indirect
	github.com/go-logfmt/logfmt v0.6.0 // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-playground/form/v4 v4.2.1 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/gorilla/mux v1.8.1 // indirect
	github.com/grafana/regexp v0.0.0-20250905093917-f7b3be9d1853 // indirect
	github.com/klauspost/compress v1.18.0 // indirect
	github.com/modern-go/reflect2 v1.0.3-0.20250322232337-35a7c28c31ee // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/philhofer/fwd v1.2.0 // indirect
	github.com/pierrec/lz4 v2.6.1+incompatible // indirect
	github.com/pierrec/lz4/v4 v4.1.22 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/prometheus/client_golang v1.23.2 // indirect
	github.com/prometheus/client_model v0.6.2 // indirect
	github.com/prometheus/common v0.66.1 // indirect
	github.com/prometheus/procfs v0.17.0 // indirect
	github.com/prometheus/prometheus v0.305.0 // indirect
	github.com/tencentcloud/tencentcloud-cls-sdk-go v1.0.12 // indirect
	github.com/tinylib/msgp v1.4.0 // indirect
	go.opentelemetry.io/auto/sdk v1.2.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.63.0 // indirect
	go.opentelemetry.io/otel v1.38.0 // indirect
	go.opentelemetry.io/otel/metric v1.38.0 // indirect
	go.opentelemetry.io/otel/sdk v1.38.0 // indirect
	go.opentelemetry.io/otel/trace v1.38.0 // indirect
	go.uber.org/atomic v1.11.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.yaml.in/yaml/v2 v2.4.3 // indirect
	golang.org/x/exp v0.0.0-20250911091902-df9299821621 // indirect
	golang.org/x/net v0.44.0 // indirect
	golang.org/x/oauth2 v0.31.0 // indirect
	golang.org/x/sync v0.17.0 // indirect
	golang.org/x/sys v0.36.0 // indirect
	golang.org/x/text v0.29.0 // indirect
	golang.org/x/time v0.13.0 // indirect
	google.golang.org/api v0.249.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20250908214217-97024824d090 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250908214217-97024824d090 // indirect
	google.golang.org/grpc v1.75.1 // indirect
	google.golang.org/protobuf v1.36.9 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	k8s.io/client-go v0.34.1 // indirect
	k8s.io/utils v0.0.0-20250820121507-0af2bda4dd1d // indirect
)
