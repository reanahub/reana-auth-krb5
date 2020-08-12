FROM python:3.6-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
      krb5-config \
      krb5-user \
      libauthen-krb5-perl \
      libkrb5-dev \
      vim-tiny \
      --no-install-recommends && \
    apt-get -y autoremove && \
    apt-get -y clean

ADD krb5.conf /etc/krb5.conf
