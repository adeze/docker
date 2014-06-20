#FROM dockerfile/java
FROM ubuntu:latest
MAINTAINER Adam Ezekiel <adeze1@gmail.com>

ENV VERSION 1.0.RC3

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update && apt-get -y install python-software-properties
#RUN add-apt-repository ppa:webupd8team/java

RUN apt-get install -y ca-certificates cron inotify-tools nano pwgen supervisor tmux wget curl

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu/ precise main" > /etc/apt/sources.list.d/java.list
RUN apt-get update
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

RUN echo "Accept Oracle software license (only required once)"
#RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true |   /usr/bin/debconf-set-selections

RUN echo "Install Oracle JDK7"
RUN apt-get install oracle-java7-installer --force-yes -y



#RUN apt-get -y install oracle-java7-installer && apt-get clean
#RUN update-alternatives --display java
#RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment
# automatically accept oracle license
#RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# and install java 7 oracle jdk
RUN apt-get -y install oracle-java7-installer && apt-get clean

RUN update-alternatives --display java
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment

RUN apt-get -y install maven
#RUN apt-get install -y oracle-java8-installer

#RUN add-apt-repository "deb http://archive.canonical.com/lucid partner"
#RUN add-apt-repository "deb http://build.discursive.com/apt/lucid main"

RUN apt-get -y update && apt-get -y upgrade

RUN mkdir -p /data/
WORKDIR /data/

#RUN dpkg --configure -a

RUN wget --no-check-certificate -O structr-ui.deb https://oss.sonatype.org/content/repositories/releases/org/structr/structr-ui/1.0.RC3/structr-ui-${VERSION}.deb

RUN dpkg -R --install /data/

#ADD the new config file eg supervisord.conf
#ADD structr.conf /usr/lib/structr-ui

RUN service structr-ui start


EXPOSE 80
EXPOSE 1337
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083

ENV KEYSTORE_FILE something
ENV KEYSTORE_PASSWORD somethingelse
#RUN keytool -genkey -keyalg RSA -alias selfsigned -keystore ${KEYSTORE_FILE} -storepass ${KEYSTORE_PASSWORD} -validity 360 -keysize 2048


#update the file if needed (still in progress)
#RUN sed -i -e "s/^bind-address/#bind-address/" /usr/lib/structr-ui/structr.conf
#RUN sed -i -e "s/^datadir.*=.*/datadir = \/data/" /usr/lib/structr-ui/structr.conf
#RUN sed -i -e "s/^innodb_buffer_pool_size.*=.*/innodb_buffer_pool_size = 64M/" /usr/lib/structr-ui/structr.conf

#or compile it perhaps?
#RUN git clone https://github.com/structr/structr.git
#RUN cd structr
#RUN mvn clean install -DskipTests
#RUN cd structr-ui
#RUN mvn exec:exec


CMD ["/bin/bash"]
