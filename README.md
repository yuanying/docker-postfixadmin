docker-postfixadmin
===================

Postfix.Admin on Docker.

## Requirement

-   MySQL
-   Docker 0.8 or higher

## Install

    docker build -t yuanying/postfixadmin .

## How to use

    docker run -d
     -e "MYSQL_PORT_3306_TCP_ADDR=172.0.0.24" \
     -e "MYSQL_PORT_3306_TCP_PORT=3306" \
     -e "POSTFIX_MYSQL_PASSWORD=postfixpassword" \
     -e "POSTFIXADMIN_SETUP_PASSWORD=POSTFIXADMIN_SETUP_PASSWORD" \
     -h 'mail.fraction.jp' \
     -p 8080:8080 \
     yuanying/postfixadmin
