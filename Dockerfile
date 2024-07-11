# Use Ubuntu LTS base image
FROM docker.io/library/ubuntu:24.04

# Use default answers in installation commands
ENV DEBIAN_FRONTEND=noninteractive

# Install all system dependencies in one go
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y \
      inotify-tools \
      krb5-config \
      krb5-user \
      libauthen-krb5-simple-perl \
      libkrb5-dev \
      vim-tiny \
      --no-install-recommends && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

# Copy Kerberos configuration file
COPY krb5.conf /etc/krb5.conf
