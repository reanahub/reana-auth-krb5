FROM docker.io/library/python:3.6-slim

ENV DEBIAN_FRONTEND=noninteractive

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y \
      inotify-tools \
      krb5-config \
      krb5-user \
      libauthen-krb5-perl \
      libkrb5-dev \
      vim-tiny \
      --no-install-recommends && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

COPY krb5.conf /etc/krb5.conf
