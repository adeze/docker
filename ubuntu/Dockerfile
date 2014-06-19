FROM dockerfile/java
MAINTAINER Adam Ezekiel <adeze1@gmail.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y ca-certificates cron inotify-tools nano pwgen supervisor tmux wget curl dpkg

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu/ precise main" > /etc/apt/sources.list.d/java.list
RUN apt-get update
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
#RUN apt-get install -y oracle-java8-installer

#RUN update-alternatives --config java


RUN wget --no-check-certificate -O structr-ui https://oss.sonatype.org/content/repositories/releases/org/structr/structr-ui/1.0.RC3/structr-ui-1.0.RC3.deb
RUN dpkg -i structr-ui


#ADD the new config file eg supervisord.conf /etc/supervisor/conf.d/nginx.conf
#or update the file
#RUN sed -i -e "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
#RUN sed -i -e "s/^datadir.*=.*/datadir = \/data/" /etc/mysql/my.cnf
#RUN sed -i -e "s/^innodb_buffer_pool_size.*=.*/innodb_buffer_pool_size = 64M/" /etc/mysql/my.cnf



EXPOSE 80
EXPOSE 1337
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083

# 'keytool -genkey -keyalg RSA -alias selfsigned -keystore [KEYSTORE_FILE] -storepass [KEYSTORE_PASSWORD] -validity 360 -keysize 2048'


RUN service structr-ui start
