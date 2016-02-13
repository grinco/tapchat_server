FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install all dependencies and prerequisites
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get -y install nodejs libsqlite3-dev build-essential

# will install tapchat
RUN npm install tapchat -g

# Bundle app source
COPY . /usr/src/app

EXPOSE 8067
CMD [ "tapchat", "start -f" ]

