FROM ubuntu:14.04
MAINTAINER Sudarshan Acharya <info@sacharya.com>

RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install python-pip && \
  pip install swiftly


ADD swiftly.conf /root/.swiftly.conf

