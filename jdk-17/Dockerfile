#指定基础镜像
FROM openjdk:17-slim-buster

MAINTAINER foxiswho@gmail.com

ENV LANG="zh_CN.UTF-8" LC_ALL="zh_CN.UTF-8" JAVA_OPT="" PROGRAM_HOME="/application" PROGRAM_APP="/application" PROGRAM_LOGS="/application/logs" TZ="Asia/Shanghai"

# add scripts
COPY scripts/* /usr/local/bin/

USER root

RUN  apt update \
&& apt install curl -y \
&& rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/${TZ} /etc/localtime \
&& echo ${TZ} > /etc/timezone \
&& echo "export LANG=${LANG}" > /etc/profile.d/locale.sh \
&& mkdir -p ${PROGRAM_LOGS} \
&& apt clean -y && \   
  rm -rf \
  /var/cache/debconf/* \
  /var/lib/apt/lists/* \
  /var/log/* \
  /var/tmp/* \
&& rm -rf /tmp/*

VOLUME ${PROGRAM_LOGS}

WORKDIR  ${PROGRAM_HOME}


CMD java ${JAVA_OPT} -jar --version

ENTRYPOINT ["docker-entrypoint.sh"]
