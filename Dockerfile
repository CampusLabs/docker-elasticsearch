FROM elasticsearch:5.1.1

ENV CONTAINERPILOT_VERSION 2.6.0
RUN curl -L https://github.com/joyent/containerpilot/releases/download/$CONTAINERPILOT_VERSION/containerpilot-$CONTAINERPILOT_VERSION.tar.gz | \
      tar xz -C /usr/local/bin/

WORKDIR /code

COPY bin /code/bin
COPY etc /code/etc
COPY etc/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

ENV CONSUL_URL consul

CMD ["bin/run"]
