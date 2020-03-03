#!/bin/bash

FROM node:12

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y \
    jq

RUN npm --global config set user root
RUN npm install -g @fortellis/fortellis-cli

ENTRYPOINT ["/entrypoint.sh"]
