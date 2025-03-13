FROM nginx:latest
RUN apt-get update -y
WORKDIR /app
COPY /app /usr/share/nginx/html
EXPOSE 80 	
CMD ["nginx", "-g", "daemon off;"]
