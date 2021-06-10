FROM alpine:latest


RUN apk add --no-cache --update cloc \
    dumb-init \
    bash \
    curl \
    git 

COPY entrypoint.sh /entrypoint.sh

COPY .clocignore /.clocignore

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"] 
