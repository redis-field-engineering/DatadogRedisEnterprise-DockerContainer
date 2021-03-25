#!/bin/bash

echo "api_key: ${DATADOG_API_KEY}" > /etc/datadog-agent/datadog.yaml
echo "ste: ${DATADOG_SITE}" >> /etc/datadog-agent/datadog.yaml

echo "init_config:" > /etc/datadog-agent/conf.d/redisenterprise.d/conf.yaml
echo "instances:" >> /etc/datadog-agent/conf.d/redisenterprise.d/conf.yaml
echo "  - host: ${REDIS_ENTERPRISE_FQDN}" >> /etc/datadog-agent/conf.d/redisenterprise.d/conf.yaml
echo "    user: ${REDIS_ENTERPRISE_USER}" >> /etc/datadog-agent/conf.d/redisenterprise.d/conf.yaml
echo "    password: ${REDIS_ENTERPRISE_PASS}" >> /etc/datadog-agent/conf.d/redisenterprise.d/conf.yaml

chown dd-agent:dd-agent /etc/datadog-agent/datadog.yaml
chown dd-agent:dd-agent /etc/datadog-agent/conf.d/redisenterprise.d/conf.yaml

usermod --shell /bin/bash dd-agent
su - dd-agent -c "/opt/datadog-agent/bin/agent/agent run -p /opt/datadog-agent/run/agent.pid"

