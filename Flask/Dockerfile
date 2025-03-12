FROM python:3.9
RUN apt-get update -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN pip3 install Flask --break-system-package
COPY /src /usr/src/app
WORKDIR /usr/src/app
CMD [ "python3", "app.py" ]