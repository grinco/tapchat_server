FROM node:0.10

# make sure you copy your backlog.db and config.json
ADD ./config/ /root/.tapchat
WORKDIR /root/

# install all dependencies and prerequisites
RUN apt-get update && apt-get -y dist-upgrade

# will install tapchat
RUN npm install tapchat coffee-script -g

# generate new ssl certificate
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/CN=tapchat" -keyout .tapchat/tapchat.pem -out .tapchat/tapchat.pem

EXPOSE 8067
CMD [ "tapchat", "start", "-f" ]

