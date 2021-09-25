# set base image (host OS)
FROM python:3.9-alpine

# set the working directory in the container
WORKDIR /vending_machine

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory


# command to run on container start