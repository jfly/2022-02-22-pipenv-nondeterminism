FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python3 \
        python3-pip \
        jq

ARG PIP_VERSION
RUN pip3 install -U pip==$PIP_VERSION
ARG PIPENV_VERSION
RUN pip3 install -U pipenv==$PIPENV_VERSION

WORKDIR /app
COPY stress-lock.sh .
COPY Pipfile .

ENTRYPOINT ["./stress-lock.sh"]
