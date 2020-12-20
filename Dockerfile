FROM php:7.2-apache
RUN docker-php-ext-install pdo_mysql
COPY ./conf/ports.conf /etc/apache2/
LABEL io.k8s.desctiption="PHP-Apache s2i builder image" \
      io.k8s.display-name="S2I builder image for sample web application on PHP+Apache" \
      io.openshift.s2i.scripts-url=image:///usr/local/s2i
COPY ./s2i/bin/ /usr/local/s2i
CMD ["/usr/local/s2i/usage"]
