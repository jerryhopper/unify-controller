#Unify-controller Dockerfile
#


###### Use Ubuntu latest and only copy in what we need to reduce the layer size ###################
FROM ubuntu:bionic
RUN apt-get update && apt-get -y install ca-certificates apt-transport-https 
RUN echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list 
RUN wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg  
RUN apt-mark hold openjdk-11-* 
RUN apt-get update && apt-get install unifi -y



###### Connect the log file to stdout #############################################################
#RUN mkdir -p /usr/local/fusionauth/logs \
#  && touch /usr/local/fusionauth/logs/fusionauth-app.log \
#  && ln -sf /dev/stdout /usr/local/fusionauth/logs/fusionauth-app.log

###### Start the App #######################################################################
#LABEL description="Create an image running FusionAuth App. Installs FusionAuth App"
#LABEL maintainer="FusionAuth Community <hopper.jerry@gmail.com>"
#EXPOSE 9011
#USER fusionauth
#ENV FUSIONAUTH_USE_GLOBAL_JAVA=1
#ENV JAVA_HOME=/opt/openjdk
#ENV PATH=$PATH:$JAVA_HOME/bin
#CMD ["/usr/local/fusionauth/fusionauth-app/apache-tomcat/bin/catalina.sh", "run"]
