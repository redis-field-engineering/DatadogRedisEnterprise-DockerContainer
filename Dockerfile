FROM	ubuntu:18.04
COPY 	datadog_redisenterprise-1.1.1-py2.py3-none-any.whl /datadog_redisenterprise-1.1.1-py2.py3-none-any.whl

# Setup the repo and key
RUN 	apt-get update -y && \
	apt-get install -y gnupg2 apt-transport-https software-properties-common && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A2923DFF56EDA6E76E55E492D3A80E30382E94DE &&\
	add-apt-repository 'deb https://apt.datadoghq.com/ stable 7' &&\
	apt-get update -y && apt-get install -y datadog-agent

RUN 	datadog-agent integration install -w /datadog_redisenterprise-1.1.1-py2.py3-none-any.whl --allow-root

COPY 	startup.sh /startup.sh

WORKDIR         /
ENTRYPOINT      [ "/startup.sh" ]

