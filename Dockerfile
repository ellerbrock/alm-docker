FROM alpine

MAINTAINER Maik Ellerbrock (github.com/ellerbrock)

ENV CONTAINER_VERSION 0.0.1
ENV CONTAINER_NAME frapsoft/alm
ENV CONTAINER_REPO https://github.com/ellerbrock/alm-docker

RUN mkdir /app && \
  adduser -h /app -s /bin/false -D app && \
  chown -R app:app /app && \
  apk update && \
  apk add --no-cache nodejs && \
  npm update && \
  npm i -g typescript tslint alm

USER app

ENV HOME=/app

WORKDIR $HOME

ENTRYPOINT ["alm"]
CMD ["--version"]
