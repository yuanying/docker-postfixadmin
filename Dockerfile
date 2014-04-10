# docker build -t yuanying/postfixadmin .
# docker run -d --link mysql:mysql \
# -e "POSTFIX_MYSQL_PASSWORD=postfixpassword" \
# -e "POSTFIXADMIN_SETUP_PASSWORD=POSTFIXADMIN_SETUP_PASSWORD" \
# -h 'mail.fraction.jp' \
# -v /home/vmail:/var/vmail \
# -p 8080:8080 \
# yuanying/postfixadmin
#
FROM ubuntu:precise
MAINTAINER O. Yuanying "yuan-docker@fraction.jp"

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:ondrej/php5
RUN apt-get update
RUN apt-get install -y curl php5 php5-mysql php5-curl php5-imap

WORKDIR /opt
RUN curl http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-2.3.7/postfixadmin-2.3.7.tar.gz -L -O
RUN tar zxvf postfixadmin-2.3.7.tar.gz
RUN ln -s /opt/postfixadmin-2.3.7 /opt/postfixadmin

ADD config.inc.php /tmp/config.inc.php
RUN mv /opt/postfixadmin/config.inc.php /opt/postfixadmin/config.inc.php.old
RUN mv /tmp/config.inc.php /opt/postfixadmin/config.inc.php
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 8080

CMD ["/usr/local/bin/run"]
