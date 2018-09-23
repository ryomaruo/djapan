FROM node:10.9 as builder
LABEL maintainer "Ryo Maruo<maruo@cbase.co.jp>"

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y vim \
    sudo

RUN npm install -g yarn
RUN yarn install
