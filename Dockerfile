FROM centos:7

WORKDIR /opt/qiyuesuo

RUN adduser qiyuesuo
#USER qiyuesuo
ADD http://dl.qiyuesuo.com/docker/server-jre-8u181-linux-x64.tar.gz ./
#COPY server-jre-8u181-linux-x64.tar.gz ./
RUN mkdir -p /usr/local/java && tar -zxf  server-jre-8u181-linux-x64.tar.gz -C /usr/local/java &&rm -rf server-jre-8u181-linux-x64.tar.gz
#ADD ./libfreetype.so.6  /lib64
#ADD ./libpng15.so.15   /lib64

ENV JAVA_HOME /usr/local/java/jdk1.8.0_181
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib
ENV LANG=en_US.utf8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY qiyuesuo /opt/qiyuesuo

# VOLUME /opt/qiyuesuo/
EXPOSE 5701 9000 9180 9181 9182
#ENTRYPOINT ["/opt/qiyuesuo/bin/entrypoint.sh"]
