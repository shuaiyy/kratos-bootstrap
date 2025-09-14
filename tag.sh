#!/bin/bash

# 主版本号
MAIN_VERSION=0.0.1

# API 相关版本
API_VERSION=0.0.1
UTILS_VERSION=0.0.1

# 基础服务版本
CACHE_REDIS_VERSION=0.0.1
OSS_MINIO_VERSION=0.0.1
LOGGER_VERSION=0.0.1
RPC_VERSION=0.0.1
TRACER_VERSION=0.0.1

# 数据库相关版本
DATABASE_ENT_VERSION=0.0.1
DATABASE_GORM_VERSION=0.0.1
DATABASE_MONGODB_VERSION=0.0.1
DATABASE_INFLUXDB_VERSION=0.0.1
DATABASE_CLICKHOUSE_VERSION=0.0.1
DATABASE_ELASTICSEARCH_VERSION=0.0.1
DATABASE_CASSANDRA_VERSION=0.0.1

# 服务注册相关版本
REGISTRY_VERSION=0.0.1
REGISTRY_CONSUL_VERSION=0.0.1
REGISTRY_ETCD_VERSION=0.0.1
REGISTRY_EUREKA_VERSION=0.0.1
REGISTRY_KUBERNETES_VERSION=0.0.1
REGISTRY_NACOS_VERSION=0.0.1
REGISTRY_POLARIS_VERSION=0.0.1
REGISTRY_SERVICECOMB_VERSION=0.0.1
REGISTRY_ZOOKEEPER_VERSION=0.0.1

# 远程配置相关版本
REMOTECONFIG_APOLLO_VERSION=0.0.1
REMOTECONFIG_CONSUL_VERSION=0.0.1
REMOTECONFIG_ETCD_VERSION=0.0.1
REMOTECONFIG_KUBERNETES_VERSION=0.0.1
REMOTECONFIG_NACOS_VERSION=0.0.1
REMOTECONFIG_POLARIS_VERSION=0.0.1

# Bootstrap 版本
BOOTSTRAP_VERSION=0.0.1

# ================================
# 创建所有标签
# ================================

echo "Creating Git tags with unified version variables..."

# API 相关标签
git tag api/v${API_VERSION} --force
git tag utils/v${UTILS_VERSION} --force

# 基础服务标签
git tag cache/redis/v${CACHE_REDIS_VERSION} --force
git tag oss/minio/v${OSS_MINIO_VERSION} --force
git tag logger/v${LOGGER_VERSION} --force
git tag rpc/v${RPC_VERSION} --force
git tag tracer/v${TRACER_VERSION} --force

# 数据库标签
git tag database/ent/v${DATABASE_ENT_VERSION} --force
git tag database/gorm/v${DATABASE_GORM_VERSION} --force
git tag database/mongodb/v${DATABASE_MONGODB_VERSION} --force
git tag database/influxdb/v${DATABASE_INFLUXDB_VERSION} --force
git tag database/clickhouse/v${DATABASE_CLICKHOUSE_VERSION} --force
git tag database/elasticsearch/v${DATABASE_ELASTICSEARCH_VERSION} --force
git tag database/cassandra/v${DATABASE_CASSANDRA_VERSION} --force

# 服务注册标签
git tag registry/v${REGISTRY_VERSION} --force
git tag registry/consul/v${REGISTRY_CONSUL_VERSION} --force
git tag registry/etcd/v${REGISTRY_ETCD_VERSION} --force
git tag registry/eureka/v${REGISTRY_EUREKA_VERSION} --force
git tag registry/kubernetes/v${REGISTRY_KUBERNETES_VERSION} --force
git tag registry/nacos/v${REGISTRY_NACOS_VERSION} --force
git tag registry/polaris/v${REGISTRY_POLARIS_VERSION} --force
git tag registry/servicecomb/v${REGISTRY_SERVICECOMB_VERSION} --force
git tag registry/zookeeper/v${REGISTRY_ZOOKEEPER_VERSION} --force

# 远程配置标签
git tag remoteconfig/apollo/v${REMOTECONFIG_APOLLO_VERSION} --force
git tag remoteconfig/consul/v${REMOTECONFIG_CONSUL_VERSION} --force
git tag remoteconfig/etcd/v${REMOTECONFIG_ETCD_VERSION} --force
git tag remoteconfig/kubernetes/v${REMOTECONFIG_KUBERNETES_VERSION} --force
git tag remoteconfig/nacos/v${REMOTECONFIG_NACOS_VERSION} --force
git tag remoteconfig/polaris/v${REMOTECONFIG_POLARIS_VERSION} --force

# Bootstrap 标签
git tag bootstrap/v${BOOTSTRAP_VERSION} --force

# 主版本标签
git tag v${MAIN_VERSION} --force

# 推送所有标签到远程仓库
echo "Pushing all tags to remote repository..."
git push origin --tags

echo "✅ All tags created and pushed successfully!"