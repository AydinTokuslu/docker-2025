FROM ubuntu:latest
RUN apt-get update -y 
RUN apt install -y apache2 
RUN apt install -y apache2-utils 
COPY /static-web /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
