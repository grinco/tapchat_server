FROM node:0.10

# make sure you copy your backlog.db, config.json and tapchat.pem to ./config/
ADD ./config/ /.tapchat
WORKDIR /

# install all dependencies and prerequisites
RUN apt-get update && apt-get -y dist-upgrade

# will install tapchat
RUN npm install tapchat coffee-script -g

EXPOSE 8067
CMD [ "tapchat", "start", "-f" ]

