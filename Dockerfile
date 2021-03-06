FROM ubuntu:14.04
MAINTAINER endokai
ENV pass endokai
ENV dashpass endokai
ADD https://github.com/fatedier/frp/releases/download/v0.22.0/frp_0.22.0_linux_amd64.tar.gz /tmp/frp.tar.gz
ADD frps.ini /tmp/frps.ini
ADD run.sh /tmp/run.sh
EXPOSE 80 443 7000 7500
RUN set -ex \
   && cd /tmp \
   && tar -zxvf frp.tar.gz \
   && install -v -D frp_0.22.0_linux_amd64/frps /bin/frps \
   && install -v -D frps.ini /bin/frps.ini \
   && install -v -D run.sh /bin/run.sh
ENTRYPOINT ["run.sh"]
