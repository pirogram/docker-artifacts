FROM node:latest

RUN npm config set registry http://registry.npmjs.org/  
RUN npm install -g nodemon
RUN apt-get update && apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     rsync \
     zip \
     imagemagick \
     software-properties-common   

RUN curl -kfsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
   add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
   && apt-get update && apt-get -y install docker-ce

COPY refresh-books.sh /usr/local/bin/refresh-books.sh

RUN mkdir -p /mnt/pirogram-server && mkdir -p /mnt/pirogram-content

WORKDIR /mnt/pirogram-server

CMD nodemon -e yaml,js,html server.js