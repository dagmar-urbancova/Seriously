# Seriously data engineer

# 1. Vending machine

## Requirements

- software design for a basic vending machine
- implement the virtual vending machine
- command-line test program to test the vending machine

## Solution

- programming language: Python

- list of items: manually specified inside the code

- test program: command line execution of the Python script

### Specifications

1. Display list of items with prices
2. Ask for input from user - ID of chosen item
3. Ask for input from user - amount of money inserted
4. Display item chosen, calculate returned money

### Possible modifications / TODOs
- item source - read from file/db
- sort items into categories, offer categories first
- sorting items by price / name / id
- adding and removing items
- updating amount of individual items sold

## execution
### Requirements:
    docker

navigate to project directory, from commandline execute following commands:
build docker image:
```
docker build -t serimage .  
```

execute docker container, which runs the script
```
docker run -it -v "/$(pwd)/vending_machine/vending_machine.py:/vending_machine.py" serimage:latest python /vending_machine.py
```


