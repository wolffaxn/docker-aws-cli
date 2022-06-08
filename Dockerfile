FROM python:3.10.5-slim AS base

ENV DEBIAN_FRONTEND=noninteractive
RUN set -eux \
  && apt-get update \
  && apt-get install -qq --no-install-recommends \
  locales \
  ; \
  rm -Rf /var/lib/apt/lists/*

FROM base AS builder

# Version: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION:-1.18.183}

ENV DEBIAN_FRONTEND=noninteractive
RUN set -eux \
  && locale-gen en_US.UTF-8 \
  && pip3 install --no-cache --upgrade pip \
  && pip3 install --no-cache --upgrade awscli==${AWS_CLI_VERSION}

FROM builder

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL

# metadata
LABEL maintainer="Alexander Wolff <wolffaxn@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.docker.dockerfile="/Dockerfile" \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vcs-url=${VCS_URL}
