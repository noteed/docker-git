# See https://github.com/noteed/docker-git.
FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -q -y language-pack-en
RUN update-locale LANG=en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y git

RUN useradd -s /bin/bash -m worker

ADD clone.sh /home/worker/clone.sh
ADD checkout.sh /home/worker/checkout.sh

USER worker
ENV HOME /home/worker
ENV LANG en_US.UTF-8
WORKDIR /home/worker

RUN mkdir /home/worker/gits
RUN mkdir /home/worker/checkout
