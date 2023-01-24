# Containers - Just what the heck are these anyway?

Material guidance for Containers event in fCC Algarve 

A bit of a word of advice about the following guide. I am an 
amateur with containers and only discovered them recently. So some
information might need correction. It would help me tremendously if
you communicate my mistakes so I can proceed to correct them in this
guide. 

## Scenario

We've finally built a new software on time. The software runs on our 
machine, a laptop with a SuperAlien OS and it's written in Hyeroglyphs++.

We want to show it to our CEO to impress him. But he's on the other
side of the world. And his machine runs Banana OS because his 
computer sucks. We send him our project but now he has to install 
all this mumbo jumbo for the program to run on his machine.

And it might not even work at the first time, he's running out of 
patience and you're running out of confidence. 

OR in the real world...

Imagine trying to install a new piece of software, for example an 
SQL server or a local SMTP email server to deliver emails. 
You'd have to follow a certain amount of steps to prepare your 
machine to have these install locally and you might even run into
some errors or incompatibilities. 

## Enter containers

Containers are isolated pieces of software that use some resources
from the host machine plus the host's kernel to deliver you the 
same services, environment and/or specs without the need to install 
dependencies, software like NPM or Composer and run into problems
and precious time wasting. 

# Containers are not Virtual Machines. 

Virtual machines require a guest operating system running alongside 
your own. They take a bit of time and a bit of resources to set up.
Not the case with containers. You can mount a container or network of 
containers from the same setup and connect them to your local code to
deliver an environment as equal as possible to the experience you'll 
get in a production environment. It requires less resources hence faster.

# Containers are instances of an image 

Images are single immmutable files that have all the dependencies and 
configurations container needs to run. 

# You program your custom images then create containers out of them

With Docker as the container software, we script our images using a file
named Dockerfile where we pull images from the Docker Hub, execute commands,
copy our projects into containers and run them in.

# But wait, there more!

We can use yaml files called docker-compose.yml to make it easier to configure
our containers. Then all we have to do is call a simple instruction 
**docker-compose up**

# But wait, there's even more!

There's a desktop software called Docker Desktop that...

## ENOUGH TALK! HAVE AT YA!

Right let's stop talking and get on with the show. 

First, we'll decide which container software we are going to use. 
Some use DevContainers, others Docker itself. For the purpose of this
event we're going to use Docker. 

1) Docker Instalation

Windows and Mac users will probably need to install Docker Desktop 
right away as it contains the CLI and the desktop software to easily 
visualize running containers. We're going to need the Docker CLI 
and you'll probably need to create an account to fetch docker images
from the hub. 

a) Docker CLI or Desktop
b) Create a Docker account or use existing account

https://docs.docker.com/get-docker/

2) Docker is Installed, let's test it. 

```docker version```

This should output Client and Server information. If something's wrong
you might need to reinstall docker.

3) List running containers

```docker ps```

It will display you Container IDS and the image they're coming from. 
Container IDs are important as they serve as reference in other 
docker commands like run, stop or kill.

## OK, we have docker installed. Can we have running containers now?

Right, let's go to https://hub.docker.com/ and search for the container
Hello world for instructions.

1) To run a container from an image: 

```docker run <image-name>```

If you don't have the image into your machine, docker will fetch it from
the docker hub and then create a container from it.

2) To just pull the image to our machine:

```docker pull <image-name>```

This will download the image without running it into a container.

We want to run the hello world image and test if docker daemon is running.
If everything works ok, docker will output you a block of text and exit 
by itself.

But what exactly is inside a container? Let's search for a precise docker
image that lets us execute a command. 

```docker run busybox ls```

You'll see a filesystem root similar to linux that is not of your machine. 
It's a filesystem snapshot from the image. 

We want to list all containers we have available in docker, not just the 
running ones.

```docker ps --all```

We can restart containers with the container ID provided.

```docker start <container-id>```

To delete all stopped containers that are just eating disk space

```docker system prune```

Now let's try running a redis server.

```docker run redis```

It will pull the redis image and start a container with a redis server. 
It will indicate you the port available to communicate.

One more important command if you want to delve into a container's filesystem
in it's own terminal

```docker exec -it <redis-container-id> sh```

You'll be able to see redis in action and execute command lines inside the container.
Run redis-cli inside the shell's container.

```redis-cli```

The redis cli prompt will come up and you can toy with it. 

``` ...:6379> set suncolor blue ```
``` ...:6379> get suncolor ```

Now run exit to get out of the redis-cli and exit again to quit the container shell. 
Do a system prune if needed to clear our images. 

Let's continue in the next phase, Dockerfiles.
