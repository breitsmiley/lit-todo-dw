ARG NODE_VERSION=12.3.1
ARG ANGULAR_CLI_VERSION=8.0.0

FROM node:${NODE_VERSION}-alpine

# GIT + Python
RUN apk --no-cache add git
RUN apk --no-cache add g++ gcc libgcc libstdc++ linux-headers make python

#######################################
#######################################

#Copy Entry point
COPY entrypoint-app.sh /usr/local/bin/entrypoint-app
RUN chmod +x /usr/local/bin/entrypoint-app
#	&& dos2unix /usr/local/bin/entrypoint-app

RUN npm install -g @angular/cli@${ANGULAR_CLI_VERSION}

# Create app directory
WORKDIR /app
#ENV PATH node_modules/.bin:$PATH # TODO

ENTRYPOINT ["entrypoint-app"]
CMD [ "ping", "127.0.0.1" ]