FROM ubuntu:18.04
RUN apt update && \
apt install default-jdk -y && \
apt install maven -y && \
apt install tomcat9 -y && \
apt install git -y && \
mkdir /home/$USER/GIT
RUN cd /home/$USER/GIT && \
git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /home/$USER/GIT/boxfuse-sample-java-war-hello && \
mvn package
RUN cp /home/$USER/GIT/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps
RUN chown -R tomcat:tomcat /var/lib/tomcat9/webapps/
RUN chown -R tomcat:tomcat /usr/share/tomcat9/
EXPOSE 8080
CMD [“/usr/share/tomcat9/bin/catalina.sh”, “run”]