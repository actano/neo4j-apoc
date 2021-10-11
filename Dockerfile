FROM alpine as download

ARG APOC_VERSION=3.5.0.15
ARG STREAMS_VERSION=3.5.13

WORKDIR /tmp

RUN wget https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar
RUN wget https://github.com/neo4j-contrib/neo4j-streams/releases/download/${STREAMS_VERSION}/neo4j-streams-${STREAMS_VERSION}.jar

FROM neo4j:3.5.29-enterprise as neo4j

ARG APOC_VERSION=3.5.0.15
ARG STREAMS_VERSION=3.5.13

COPY --from=download /tmp/apoc-${APOC_VERSION}-all.jar /plugins/apoc-${APOC_VERSION}-all.jar
COPY --from=download /tmp/neo4j-streams-${STREAMS_VERSION}.jar /plugins/neo4j-streams-${STREAMS_VERSION}.jar
