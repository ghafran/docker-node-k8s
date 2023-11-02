FROM alpine:3.17

RUN apk add nodejs-current npm
RUN npm install -g yarn
RUN npm install -g nodemon
RUN npm install -g vite@latest

RUN mkdir -p /node/library
RUN mkdir -p /node/admin-api
RUN mkdir -p /node/admin-web
RUN mkdir -p /node/blob-api
RUN mkdir -p /node/cron
RUN mkdir -p /node/database
RUN mkdir -p /node/devices-api
RUN mkdir -p /node/devices-web
RUN mkdir -p /node/devices-os
RUN mkdir -p /node/integration-api
RUN mkdir -p /node/meeting-api
RUN mkdir -p /node/partner-api
RUN mkdir -p /node/partner-web
RUN mkdir -p /node/portal-api
RUN mkdir -p /node/portal-web
RUN mkdir -p /node/pubsub-api
RUN mkdir -p /node/status
RUN mkdir -p /node/workers
RUN mkdir -p /node/helper

COPY ./library/package.json /node/library/package.json
COPY ./admin-api/package.json /node/admin-api/package.json
COPY ./admin-web/package.json /node/admin-web/package.json
COPY ./blob-api/package.json /node/blob-api/package.json
COPY ./cron/package.json /node/cron/package.json
COPY ./database/package.json /node/database/package.json
COPY ./devices-api/package.json /node/devices-api/package.json
COPY ./devices-web/package.json /node/devices-web/package.json
COPY ./devices-os/package.json /node/devices-os/package.json
COPY ./integration-api/package.json /node/integration-api/package.json
COPY ./meeting-api/package.json /node/meeting-api/package.json
COPY ./partner-api/package.json /node/partner-api/package.json
COPY ./partner-web/package.json /node/partner-web/package.json
COPY ./portal-api/package.json /node/portal-api/package.json
COPY ./portal-web/package.json /node/portal-web/package.json
COPY ./pubsub-api/package.json /node/pubsub-api/package.json
COPY ./status/package.json /node/status/package.json
COPY ./workers/package.json /node/workers/package.json
COPY ./helper/package.json /node/helper/package.json

WORKDIR "/node/devices-os"
RUN sed -i '/usb-detection/d' package.json

WORKDIR "/node/library"
RUN yarn install --network-timeout 100000
WORKDIR "/node/admin-api"
RUN yarn install --network-timeout 100000
# WORKDIR "/node/admin-web"
# RUN yarn install --network-timeout 100000
WORKDIR "/node/blob-api"
RUN yarn install --network-timeout 100000
WORKDIR "/node/cron"
RUN yarn install --network-timeout 100000
WORKDIR "/node/database"
RUN yarn install --network-timeout 100000
WORKDIR "/node/devices-api"
RUN yarn install --network-timeout 100000
# WORKDIR "/node/devices-web"
# RUN yarn install --network-timeout 100000
RUN yarn install --network-timeout 100000
WORKDIR "/node/integration-api"
RUN yarn install --network-timeout 100000
WORKDIR "/node/meeting-api"
RUN yarn install --network-timeout 100000
WORKDIR "/node/partner-api"
RUN yarn install --network-timeout 100000
# WORKDIR "/node/partner-web"
# RUN yarn install --network-timeout 100000
WORKDIR "/node/portal-api"
RUN yarn install --network-timeout 100000
# WORKDIR "/node/portal-web"
# RUN yarn install --network-timeout 100000
WORKDIR "/node/pubsub-api"
RUN yarn install --network-timeout 100000
WORKDIR "/node/status"
RUN yarn install --network-timeout 100000
WORKDIR "/node/workers"
RUN yarn install --network-timeout 100000
WORKDIR "/node/helper"
RUN yarn install --network-timeout 100000
