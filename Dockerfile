FROM quay.io/orgsync/java:1.8
MAINTAINER Joshua Griffith <joshua@orgsync.com>

ENV ELASTICSEARCH_VERSION 1.5.2

# Install ElasticSearch.
RUN mkdir /elasticsearch \
    && wget -q -O - "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz" \
        | tar xzC /elasticsearch --strip-components=1

# Mount elasticsearch.yml config
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

RUN /elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/1.5.2

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]
