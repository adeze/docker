FROM debian:latest
MAINTAINER Adam Ezekiel <adeze1@gmail.com>
#ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
ENV PATH $JAVA_HOME/bin:$PATH
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y ca-certificates cron inotify-tools nano pwgen supervisor tmux wget curl

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu/ precise main" > /etc/apt/sources.list.d/java.list
RUN apt-get update
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer



RUN wget --no-check-certificate -O structr-ui https://oss.sonatype.org/content/repositories/releases/org/structr/structr-ui/1.0.RC3/structr-ui-1.0.RC3.deb
RUN dpkg -i structr-ui

EXPOSE 80
EXPOSE 1337
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083


RUN service structr-ui start

CMD["bash"]
