FROM python:alpine
COPY . /app
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8080
CMD python ./app.py