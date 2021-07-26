FROM codercom/code-server:3.10.2
# ADD
ADD soft/jdk1.8.0_181 /usr/local/jdk1.8.0_181/
ADD soft/apache-maven-3.6.3 /usr/local/apache-maven-3.6.3/
ADD soft/scala-2.11.12 /usr/local/scala-2.11.12/
# code-server总配置文件
ADD settings.json /root/.local/share/code-server/User/
# code-server已安装的插件
ADD extensions /root/.local/share/code-server/extensions
ADD config.yaml /root/.config/code-server/config.yaml

# Env
ENV JAVA_HOME /usr/local/jdk1.8.0_181
ENV JRE_HOME /usr/local/jdk1.8.0_181/jre
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV SCALA_HOME /usr/local/scala-2.11.12
ENV MAVEN_HOME=/usr/local/apache-maven-3.6.3

ENV PATH=$MAVEN_HOME/bin:$SCALA_HOME/bin:$PATH

WORKDIR /home/coder/project
VOLUME /home/coder/project /root/.local/share/code-server/extensions

EXPOSE 8080 22
# 容器启动code-server：指定插件目录，指定中文，指定免密登录
ENTRYPOINT ["code-server","-locale","zh-cn","--auth","123456"]