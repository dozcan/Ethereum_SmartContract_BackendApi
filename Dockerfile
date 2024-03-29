FROM node:8.11.3-jessie

RUN mkdir /opt/api
COPY . /opt/api
WORKDIR /opt/api

RUN apt-get dist-upgrade
RUN apt-get update
RUN npm config set always-auth true;
RUN apt-get install -y build-essential libssl-dev
RUN npm install node-gyp
RUN npm install scrypt
RUN npm install web3 

#--unsafe-perm=true --allow-root
ARG NODE_IP
ARG NODE_PORT

ENV NODE_IP ${NODE_IP}
ENV NODE_PORT ${NODE_PORT}

EXPOSE 6000
CMD [ "index.js" ]
ENTRYPOINT ["node"]
