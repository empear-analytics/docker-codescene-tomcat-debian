FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install git tomcat9

USER root

ENV CATALINA_HOME /usr/share/tomcat9
# CATALINA_BASE is needed for tomcat to worker properly - there are two locations on debian
# - /var/lib/tomcat9 which contains webapps dir and some other stuff
# - /usr/share/tomcat9 which contains bin dir with catalina.sh script
# If you don't set CATALINA_BASE then you'll get an error because of missing server.xml
ENV CATALINA_BASE /var/lib/tomcat9

COPY tomcat-users.xml ${CATALINA_HOME}/etc/
COPY context.xml ${CATALINA_HOME}/etc/

ARG CODESCENE_VERSION=3.5.18
ADD https://downloads.codescene.io/enterprise/${CODESCENE_VERSION}/codescene-enterprise-edition.war ${CATALINA_BASE}/webapps
#ADD codescene-enterprise-edition.war ${CATALINA_BASE}/webapps

EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
