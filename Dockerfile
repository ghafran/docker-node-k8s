FROM alpine:3.14.2

RUN apk add nodejs-current npm
RUN npm install -g yarn
RUN npm install -g forever

RUN mkdir -p /node/app
RUN mkdir -p /node/library
RUN mkdir -p /node/web
RUN mkdir -p /node/device

COPY ./app/package.json /node/app/package.json
COPY ./library/package.json /node/library/package.json
COPY ./web/package.json /node/web/package.json
COPY ./device/package.json /node/device/package.json

WORKDIR "/node/app"
RUN yarn install --network-timeout 100000

WORKDIR "/node/library"
RUN yarn install --network-timeout 100000

WORKDIR "/node/web"
RUN yarn install --network-timeout 100000

WORKDIR "/node/device"
RUN yarn install --network-timeout 100000