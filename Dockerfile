FROM ubuntu:18.04

RUN apt-get update
RUN apt install -y supervisor nodejs

RUN apt install -y npm

ADD index.html /srv/index.html
ADD app.js /srv/app.js

RUN /bin/mkdir -p /srv/logs

WORKDIR /srv

RUN npm install --silent socket.io express
RUN npm dedupe

EXPOSE 8080

CMD ["node", "app.js"]