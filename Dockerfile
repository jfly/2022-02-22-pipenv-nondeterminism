FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python3 \
        python3-pip \
        jq

RUN pip3 install -U pip==22.2.2  # the latest version as of 2022-08-09
RUN pip3 install -U pipenv==2022.8.5  # the latest version as of 2022-08-09

WORKDIR /app
COPY stress-lock.sh .
COPY Pipfile .

ENTRYPOINT ["./stress-lock.sh"]
