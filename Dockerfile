# set base image (host OS)
FROM python:3.9-slim-buster

# set the working directory in the container
WORKDIR /vending_machine

# copy the dependencies file to the working directory
# COPY requirements.txt .

# install dependencies
# RUN pip install -r requirements.txt

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
            pandas

# copy the content of the local src directory to the working directory
COPY ./vending_machine/vending_machine.py .

# command to run on container start
CMD [ "python", "vending_machine.py", "-u" ]