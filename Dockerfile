FROM node:8.1.0-alpine

ARG IMAGE_CREATE_DATE
ARG IMAGE_VERSION
ARG IMAGE_SOURCE_REVISION

# Metadata as defined in OCI image spec annotations - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="Hello K8s." \
      org.opencontainers.image.description="Пример для показа установки контейнеризованного приложения в Kubernetes кластер. Приложение выводит приветственное сообщение, имя Pod-а и версию ОС хоста на которой запущено." \
      org.opencontainers.image.created=$IMAGE_CREATE_DATE \
      org.opencontainers.image.version=$IMAGE_VERSION \
      org.opencontainers.image.authors="Альберт Халиулов" \
      org.opencontainers.image.url="https://hub.docker.com/r/ahaliulov/hello-k8s" \
      org.opencontainers.image.documentation="https://github.com/albert-haliulov/2019-cloud-lab-for-sales/README.md" \
      org.opencontainers.image.vendor="" \
      org.opencontainers.image.licenses="" \
      org.opencontainers.image.source="https://github.com/albert-haliulov/2019-cloud-lab-for-sales.git" \
      org.opencontainers.image.revision=$IMAGE_SOURCE_REVISION 

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY app/package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY app/ /usr/src/app

CMD [ "npm", "start" ]