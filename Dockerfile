FROM openjdk:11.0.3-jdk-stretch

MAINTAINER foxiswho@gmail.com

ARG ip
ARG port

#host
ENV IP ${ip:-localhost}
#ip
ENV PORT ${port:-8080}

ENV JAVA_OPT=""

# opt home
ENV PROGRAM_HOME  /opt
ENV PROGRAM_APP  /opt
ENV PROGRAM_LOGS  /opt/logs


# add scripts
COPY scripts/* /usr/local/bin/

RUN rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/localtime \
&& mkdir -p ${PROGRAM_LOGS} && mkdir -p ${PROGRAM_APP} \
&& chmod +x /usr/local/bin/docker-entrypoint.sh \
&& ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh

USER root

#RUN chmod -R +x ${PROGRAM_HOME}*jar

VOLUME ${PROGRAM_LOGS}

WORKDIR  ${PROGRAM_HOME}

#RUN java -version

EXPOSE ${PORT}


CMD java ${JAVA_OPT} -jar --version

ENTRYPOINT ["docker-entrypoint.sh"]


