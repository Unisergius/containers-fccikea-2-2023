# Containers - Just what the heck are these anyway?

Material guidance for Containers event in fCC Algarve 

A bit of a word of advice about the following guide. I am an 
amateur with containers and only discovered them recently. So some
information might need correction. It would help me tremendously if
you communicate my mistakes so I can proceed to correct them in this
guide. 

Imagine trying to install a new piece of software, for example an 
SQL server or a local SMTP email server to deliver emails. 
You'd have to follow a certain amount of steps to prepare your 
machine to have these install locally and you might even run into
some errors or incompatibilities. 

## Enter containers

Containers are isolated pieces of software that use some resources
from your host machine plus the host's kernel to deliver you the 
desired services without the need to install dependencies and run 
into problems. 

# Containers are not Virtual Machines. 

Virtual machines require a guest operating system running alongside 
your own. They take a bit of time and a bit of resources to set up.
Not the case with containers. You can mount a container or network of 
containers from the same setup and connect them to your local code to
deliver an environment as equal as possible to the experience you'll 
get in a production environment. 

## ENOUGH TALK! HAVE AT YA!

Right let's stop talking and get on with the show. 

First, we'll decide which container software we are going to use. 
Some use DevContainers, others Docker itself. For the purpose of this
event we're going to use docker. 

1) Docker Instalation

Windows users will probably need some software in advance like WSL2.
Linux and Mac users are lucky, they won't need much time to install 
Docker.

https://docs.docker.com/get-docker/
