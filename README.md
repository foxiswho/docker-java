# docker-java
docker java



自用 java 容器 ，未验证，待完善


args 
 ip: ip 地址，不传默认 localhost
 port: 端口 ，不传，默认 8080
 
环境变量

 JAVA_OPT_EXT: 额外 参数


目录

/root

日志目录

/root/logs



例如：`/provider/app.jar` 文件位置

```bash
docker run -it --rm -p 8080:8080 \
-e JAVA_OPT_EXT=" -jar /root/app.jar --spring.profiles.active=dev -Pdev" \
-v /provider/app.jar:/root/app.jar \
foxiswho/java
```
