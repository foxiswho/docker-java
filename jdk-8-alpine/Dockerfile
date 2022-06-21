# 指定基础镜像，这是分阶段构建的前期阶段
FROM openjdk:8-jdk-alpine
# 配置参数
#ARG JAR_FILE=build/libs/*.jar
# 执行工作目录
WORKDIR application
# 将编译构建得到的jar文件复制到镜像空间中
#COPY ${JAR_FILE} application.jar

ENV JAVA_OPT="--version" PROGRAM_APP=/application PROGRAM_LOGS=/application/logs TZ=Asia/Shanghai
RUN pwd \
    && ls -lh . \
    && ln -s /application /root/application \
    && mkdir -p ${PROGRAM_LOGS} && mkdir -p ${PROGRAM_APP}  \
    && cat /etc/apk/repositories \
    && echo "https://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories \
    && echo "https://mirrors.aliyun.com/alpine/v3.9/community/" >> /etc/apk/repositories \
    && apk update upgrade --allow-untrusted \
    && apk add --no-cache procps unzip curl bash tzdata \
    && apk add ttf-dejavu \
    && rm -rf /etc/localtime \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache \
    && rm -rf /tmp/*

CMD java ${JAVA_OPT}