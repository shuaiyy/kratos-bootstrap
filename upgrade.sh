#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
echo "Script directory: $script_dir"

cd "$script_dir"

# 设置基础目录
DIR="$script_dir"

echo "Starting Go modules upgrade..."
echo "================================"

# 升级 API 模块
if [ -d "$DIR/api" ]; then
    echo "Upgrading api..."
    cd "$DIR/api"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded api"
else
    echo "⚠️  Directory api not found, skipping..."
fi

# 升级 utils 模块
if [ -d "$DIR/utils" ]; then
    echo "Upgrading utils..."
    cd "$DIR/utils"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded utils"
else
    echo "⚠️  Directory utils not found, skipping..."
fi

# 升级 cache/redis 模块
if [ -d "$DIR/cache/redis" ]; then
    echo "Upgrading cache/redis..."
    cd "$DIR/cache/redis"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded cache/redis"
else
    echo "⚠️  Directory cache/redis not found, skipping..."
fi

# 升级 logger 模块
if [ -d "$DIR/logger" ]; then
    echo "Upgrading logger..."
    cd "$DIR/logger"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded logger"
else
    echo "⚠️  Directory logger not found, skipping..."
fi

# 升级 tracer 模块
if [ -d "$DIR/tracer" ]; then
    echo "Upgrading tracer..."
    cd "$DIR/tracer"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded tracer"
else
    echo "⚠️  Directory tracer not found, skipping..."
fi

# 升级 remoteconfig 模块
echo "Upgrading remoteconfig modules..."

if [ -d "$DIR/remoteconfig/apollo" ]; then
    echo "Upgrading remoteconfig/apollo..."
    cd "$DIR/remoteconfig/apollo"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded remoteconfig/apollo"
else
    echo "⚠️  Directory remoteconfig/apollo not found, skipping..."
fi

if [ -d "$DIR/remoteconfig/consul" ]; then
    echo "Upgrading remoteconfig/consul..."
    cd "$DIR/remoteconfig/consul"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded remoteconfig/consul"
else
    echo "⚠️  Directory remoteconfig/consul not found, skipping..."
fi

if [ -d "$DIR/remoteconfig/etcd" ]; then
    echo "Upgrading remoteconfig/etcd..."
    cd "$DIR/remoteconfig/etcd"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded remoteconfig/etcd"
else
    echo "⚠️  Directory remoteconfig/etcd not found, skipping..."
fi

if [ -d "$DIR/remoteconfig/kubernetes" ]; then
    echo "Upgrading remoteconfig/kubernetes..."
    cd "$DIR/remoteconfig/kubernetes"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded remoteconfig/kubernetes"
else
    echo "⚠️  Directory remoteconfig/kubernetes not found, skipping..."
fi

if [ -d "$DIR/remoteconfig/nacos" ]; then
    echo "Upgrading remoteconfig/nacos..."
    cd "$DIR/remoteconfig/nacos"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded remoteconfig/nacos"
else
    echo "⚠️  Directory remoteconfig/nacos not found, skipping..."
fi

if [ -d "$DIR/remoteconfig/polaris" ]; then
    echo "Upgrading remoteconfig/polaris..."
    cd "$DIR/remoteconfig/polaris"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded remoteconfig/polaris"
else
    echo "⚠️  Directory remoteconfig/polaris not found, skipping..."
fi

# 升级 registry 模块
echo "Upgrading registry modules..."

if [ -d "$DIR/registry" ]; then
    echo "Upgrading registry..."
    cd "$DIR/registry"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry"
else
    echo "⚠️  Directory registry not found, skipping..."
fi

if [ -d "$DIR/registry/consul" ]; then
    echo "Upgrading registry/consul..."
    cd "$DIR/registry/consul"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/consul"
else
    echo "⚠️  Directory registry/consul not found, skipping..."
fi

if [ -d "$DIR/registry/etcd" ]; then
    echo "Upgrading registry/etcd..."
    cd "$DIR/registry/etcd"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/etcd"
else
    echo "⚠️  Directory registry/etcd not found, skipping..."
fi

if [ -d "$DIR/registry/eureka" ]; then
    echo "Upgrading registry/eureka..."
    cd "$DIR/registry/eureka"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/eureka"
else
    echo "⚠️  Directory registry/eureka not found, skipping..."
fi

if [ -d "$DIR/registry/kubernetes" ]; then
    echo "Upgrading registry/kubernetes..."
    cd "$DIR/registry/kubernetes"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/kubernetes"
else
    echo "⚠️  Directory registry/kubernetes not found, skipping..."
fi

if [ -d "$DIR/registry/nacos" ]; then
    echo "Upgrading registry/nacos..."
    cd "$DIR/registry/nacos"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/nacos"
else
    echo "⚠️  Directory registry/nacos not found, skipping..."
fi

if [ -d "$DIR/registry/polaris" ]; then
    echo "Upgrading registry/polaris..."
    cd "$DIR/registry/polaris"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/polaris"
else
    echo "⚠️  Directory registry/polaris not found, skipping..."
fi

if [ -d "$DIR/registry/servicecomb" ]; then
    echo "Upgrading registry/servicecomb..."
    cd "$DIR/registry/servicecomb"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/servicecomb"
else
    echo "⚠️  Directory registry/servicecomb not found, skipping..."
fi

if [ -d "$DIR/registry/zookeeper" ]; then
    echo "Upgrading registry/zookeeper..."
    cd "$DIR/registry/zookeeper"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded registry/zookeeper"
else
    echo "⚠️  Directory registry/zookeeper not found, skipping..."
fi

# 升级 OSS 模块
if [ -d "$DIR/oss/minio" ]; then
    echo "Upgrading oss/minio..."
    cd "$DIR/oss/minio"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded oss/minio"
else
    echo "⚠️  Directory oss/minio not found, skipping..."
fi

# 升级 database 模块
echo "Upgrading database modules..."

if [ -d "$DIR/database/cassandra" ]; then
    echo "Upgrading database/cassandra..."
    cd "$DIR/database/cassandra"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded database/cassandra"
else
    echo "⚠️  Directory database/cassandra not found, skipping..."
fi

if [ -d "$DIR/database/clickhouse" ]; then
    echo "Upgrading database/clickhouse..."
    cd "$DIR/database/clickhouse"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded database/clickhouse"
else
    echo "⚠️  Directory database/clickhouse not found, skipping..."
fi

if [ -d "$DIR/database/elasticsearch" ]; then
    echo "Upgrading database/elasticsearch..."
    cd "$DIR/database/elasticsearch"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded database/elasticsearch"
else
    echo "⚠️  Directory database/elasticsearch not found, skipping..."
fi

if [ -d "$DIR/database/ent" ]; then
    echo "Upgrading database/ent..."
    cd "$DIR/database/ent"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded database/ent"
else
    echo "⚠️  Directory database/ent not found, skipping..."
fi

if [ -d "$DIR/database/gorm" ]; then
    echo "Upgrading database/gorm..."
    cd "$DIR/database/gorm"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded database/gorm"
else
    echo "⚠️  Directory database/gorm not found, skipping..."
fi

if [ -d "$DIR/database/influxdb" ]; then
    echo "Upgrading database/influxdb..."
    cd "$DIR/database/influxdb"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded database/influxdb"
else
    echo "⚠️  Directory database/influxdb not found, skipping..."
fi

if [ -d "$DIR/database/mongodb" ]; then
    echo "Upgrading database/mongodb..."
    cd "$DIR/database/mongodb"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded database/mongodb"
else
    echo "⚠️  Directory database/mongodb not found, skipping..."
fi

# 升级 RPC 模块
if [ -d "$DIR/rpc" ]; then
    echo "Upgrading rpc..."
    cd "$DIR/rpc"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded rpc"
else
    echo "⚠️  Directory rpc not found, skipping..."
fi

# 升级 bootstrap 模块
if [ -d "$DIR/bootstrap" ]; then
    echo "Upgrading bootstrap..."
    cd "$DIR/bootstrap"
    go get -u ./...
    go mod tidy
    echo "✅ Upgraded bootstrap"
else
    echo "⚠️  Directory bootstrap not found, skipping..."
fi

# 升级根模块
echo "Upgrading root module..."
cd "$DIR"
go get -u ./...
go mod tidy

echo "================================"
echo "🎉 All modules upgraded successfully!"
