FROM alpine as download

ARG APOC_VERSION=3.5.0.15

WORKDIR /tmp

RUN wget https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar

FROM neo4j:3.5.29-enterprise as neo4j

ARG APOC_VERSION=3.5.0.15

COPY --from=download /tmp/apoc-${APOC_VERSION}-all.jar /plugins/apoc-${APOC_VERSION}-all.jar
