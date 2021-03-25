#################################################
default:	deps docker

deps:
	rm -f datadog_redisenterprise-0.1.6-py2.py3-none-any.whl
	wget https://redislabs-field-engineering.s3-us-west-1.amazonaws.com/beta/data-dog/v0.1.6/datadog_redisenterprise-0.1.6-py2.py3-none-any.whl

docker:
	docker build -t maguec/redisenterprise-dd-beta .
	rm -f datadog_redisenterprise-0.1.6-py2.py3-none-any.whl

