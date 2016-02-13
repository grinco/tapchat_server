FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# will install tapchat
RUN npm install tapchat -g

# Bundle app source
COPY . /usr/src/app

EXPOSE 8067
CMD [ "tapchat", "start" ]

