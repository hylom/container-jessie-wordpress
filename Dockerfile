FROM debian:jessie
MAINTAINER hylom@hylom.net
ENV WORDPRESS_URL=https://ja.wordpress.org/latest-ja.tar.gz

RUN apt-get update -y
RUN apt-get install -y apache2 php5 php5-gd php5-curl php5-mysql php5-json 
RUN apt-get install -y curl

RUN curl -o /tmp/wp.tgz $WORDPRESS_URL && cd /var/www/html && tar xvzf /tmp/wp.tgz && rm -f /tmp/wp.tgz
RUN chown -R www-data:www-data /var/www/html/wordpress

COPY entry-point.sh /entry-point.sh
RUN chmod 755 /entry-point.sh

EXPOSE 80
ENTRYPOINT ["/entry-point.sh"]
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]


