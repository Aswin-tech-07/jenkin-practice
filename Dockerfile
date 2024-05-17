FROM ubunut:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install apache2 -y
RUN apt install apache2-utils -y
RUN apt clean
COPY index.html /var/www/html
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]

