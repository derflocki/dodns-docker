FROM alpine:3.16

MAINTAINER Florian Dorn <florian.dorn@gmail.com>

RUN apk update && apk add curl

ADD run.sh /opt/run.sh

CMD ["sh", "/opt/run.sh"]
