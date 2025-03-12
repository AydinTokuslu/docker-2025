FROM nginx:latest
RUN apt-get update -y
WORKDIR /deneme
COPY /myapp /usr/share/nginx/html
EXPOSE 80 	
CMD ["nginx", "-g", "daemon off;"]