FROM python:3.9
RUN apt-get update -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN pip3 install Flask --break-system-package
COPY . /app
WORKDIR /app
CMD [ "python3", "app.py" ]


# FROM python:3.9

# # Set the working directory in the container
# WORKDIR /app

# # Copy the current directory contents into the container at /app
# COPY . /app

# # Install any needed packages specified in requirements.txt
# RUN pip install --no-cache-dir flask
# RUN pip install requests beautifulsoup4 python-dotenv
# # Make port 5000 available to the world outside this container
# EXPOSE 5000

# # Define environment variable
# ENV FLASK_APP=app.py

# # Run app.py when the container launches
# CMD ["python", "app.py"]

# FROM python:3.12-alpine
# WORKDIR /code
# ENV FLASK_APP=app.py
# #ENV FLASK_RUN_HOST=0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# EXPOSE 5000
# COPY . .
# CMD [ "python", "app.py" ]
