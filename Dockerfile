FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python3 \
        python3-pip \
        jq

RUN pip3 install -U pip==22.0.3  # the latest version as of 2022-02-22
RUN pip3 install -U pipenv==2022.1.8  # the latest version as of 2022-02-22

WORKDIR /app
COPY stress-lock.sh .
COPY Pipfile .

ENTRYPOINT ["./stress-lock.sh"]
