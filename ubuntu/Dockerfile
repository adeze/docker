FROM dockerfile/java
MAINTAINER Adam Ezekiel <adeze1@gmail.com>

ENV VERSION 1.0.RC3

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y ca-certificates cron inotify-tools nano pwgen supervisor tmux wget curl dpkg

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
#RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu/ precise main" > /etc/apt/sources.list.d/java.list
#RUN apt-get update
#RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
#RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

#RUN echo "Accept Oracle software license (only required once)"
#RUN sudo echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true |   /usr/bin/debconf-set-selections

#RUN echo "Install Oracle JDK7"
#RUN apt-get install oracle-java7-installer --force-yes -y



#RUN apt-get install -y oracle-java8-installer

#RUN update-alternatives --config java

#RUN add-apt-repository "deb http://archive.canonical.com/lucid partner"
#RUN add-apt-repository "deb http://build.discursive.com/apt/lucid main"

#RUN add-apt-repository "deb http://oss.sonatype.org/content/repositories/releases/org/structr/structr-ui/ "
#1.0.RC3/structr-ui-${VERSION}.deb
# https://oss.sonatype.org/content/repositories/snapshots/org/structr/structr-ui/

RUN apt-get update
RUN apt-get upgrade -y

RUN mkdir -p /data/
WORKDIR /data/

RUN dpkg --configure -a

RUN wget --no-check-certificate -O /data/structr-ui.deb https://oss.sonatype.org/content/repositories/releases/org/structr/structr-ui/1.0.RC3/structr-ui-${VERSION}.deb



#RUN dpkg -i /data/structr-ui.deb

RUN dpkg -f -R --install /data

EXPOSE 80
EXPOSE 1337
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083

# 'keytool -genkey -keyalg RSA -alias selfsigned -keystore [KEYSTORE_FILE] -storepass [KEYSTORE_PASSWORD] -validity 360 -keysize 2048'
#ADD the new config file eg supervisord.conf
# ADD structr.conf /usr/lib/structr-ui
#or update the file
#RUN sed -i -e "s/^bind-address/#bind-address/" /usr/lib/structr-ui/structr.conf
#RUN sed -i -e "s/^datadir.*=.*/datadir = \/data/" /usr/lib/structr-ui/structr.conf
#RUN sed -i -e "s/^innodb_buffer_pool_size.*=.*/innodb_buffer_pool_size = 64M/" /usr/lib/structr-ui/structr.conf



#RUN service structr-ui start

CMD ["bash"]
