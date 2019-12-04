FROM node:lts-alpine

COPY phaserquest/ /usr/src/app
COPY _files/ /tmp/

RUN cd /usr/src/app && \
    npm install -g cnpm --registry=https://registry.npm.taobao.org && \
    apk add perl && \
    cnpm install && \
    cnpm install pm2 -g && \
    addgroup -S ctf && adduser -S ctf -G ctf && \
    mv /tmp/processes.yml /root/processes.yml && \
    mv /tmp/flag /flag && \
    mv /tmp/readflag /readflag && \
    mv /tmp/start.sh /start.sh && \
    chmod +x /start.sh && \
    chmod 555 /readflag && \
    chmod u+s /readflag && \
    chmod 500 /flag && \
    chmod -R 555 /usr/src/app && \
    chmod -R 500 /root/processes.yml

WORKDIR /usr/src/app

EXPOSE 8081

ENTRYPOINT ["/start.sh"]
