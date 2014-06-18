FROM maxexcloo/java:latest
MAINTAINER Adam Ezekiel <adeze1@gmail.com>
RUN wget --no-check-certificate -O structr-ui https://oss.sonatype.org/content/repositories/releases/org/structr/structr-ui/1.0.RC3/structr-ui-1.0.RC3.deb
RUN dpkg -i structr-ui
RUN service structr-ui start
EXPOSE 80
EXPOSE 1337
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083
