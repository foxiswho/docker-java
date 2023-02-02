#指定基础镜像
FROM alpine:3.17

MAINTAINER foxiswho@gmail.com

ENV LANG="zh_CN.UTF-8" LC_ALL="zh_CN.UTF-8" JAVA_OPT="" PROGRAM_HOME="/application" PROGRAM_APP="/application" PROGRAM_LOGS="/application/logs" TZ="Asia/Shanghai"

# add scripts
COPY scripts/* /usr/local/bin/

USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&& apk update upgrade --allow-untrusted \
&& apk add --no-cache --virtual .build-deps binutils busybox curl bash tzdata \
&& apk add ttf-dejavu \
&& rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/${TZ} /etc/localtime \
&& echo ${TZ} > /etc/timezone \
&& echo "export LANG=${LANG}" > /etc/profile.d/locale.sh \
&& apk del tzdata .build-deps \
&& mkdir -p ${PROGRAM_LOGS} \
&& apk add --no-cache --virtual openjdk17 openjdk17-jdk openjdk17-jmods \
&& rm -rf /var/cache/apk/* \
&& rm -rf /root/.cache \
&& rm -rf /tmp/* \

VOLUME ${PROGRAM_LOGS}

WORKDIR  ${PROGRAM_HOME}


CMD java ${JAVA_OPT} -jar --version

ENTRYPOINT ["docker-entrypoint.sh"]
