FROM node:boron

COPY phaserquest/ /usr/src/app
COPY _files/ /tmp/

RUN apt-get update && \
    apt-get -y upgrade && \
    npm install && \
    npm install pm2 -g && \
    useradd -m ctf && \
    mv /tmp/processes.yml /root/processes.yml && \
    mv /tmp/flag /flag && \
    mv /tmp/readflag /readflag && \
    chmod 555 /readflag && \
    chmod u+s /readflag && \
    chmod 500 /flag && \
    chmod -R 555 /usr/src/app && \
    chmod -R 500 /root/processes.yml

WORKDIR /usr/src/app

EXPOSE 10081
