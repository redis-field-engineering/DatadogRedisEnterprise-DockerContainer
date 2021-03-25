# Dockerized Beta of Redis Enterprise Datadog Agent

## Building the Container

edit the Makefile and change maguec to your docker prefix

```
make
```

## Running the Container

```
docker run --rm -e DATADOG_API_KEY=<DATADOG-API-KEY> -e DATADOG_SITE=datadoghq.com \
	-e REDIS_ENTERPRISE_FQDN=<FQDN:mycluster.example.com> -e REDIS_ENTERPRISE_USER=<USER:datadog@example.com> \
	-e REDIS_ENTERPRISE_PASS=<PASSWORD:myPass> maguec/redisenterprise-dd-beta
```

## Support 

Please contact your friendly Solutions Architect for support