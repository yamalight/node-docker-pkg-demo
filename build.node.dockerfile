FROM node:latest AS build
WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . /app
RUN yarn package
