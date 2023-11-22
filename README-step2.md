# Dockerfile files

Alright, commands are annoying anyway. We want to get a server working
without me having to install nginx or node. 

No problem. We're going to skip some introductions in dockerfile and 
let's begin by setting a simple nodejs file that accepts a request from
the browser. Let's begin with a hello world with the expressjs

https://expressjs.com/en/starter/hello-world.html

just copy the code and paste it in a index.js inside a folder 
called docker-hello. You'll need express.js so hopefully you
have npm in your machine :D (oops)

```
> npm init
> npm install express
```

Now we will search for node images that have alpine linux in the Docker hub.

Alpine linux images tend to be very small and it's ideal to pull specially
if we're in IKEA's wifi. 

Let's use the node:19-alpine for this exercise.

Now for the Dockerfile let's write the following: 

```
FROM node:19-alpine

WORKDIR /home/node/app

COPY package.json ./

COPY package-lock.json ./

RUN npm install

COPY ./index.js ./

ENV PORT=8080

EXPOSE 8080

CMD [ "npm", "start" ]
```

We should have the necessary directives to run our little expressjs app inside
a container with docker.

```docker build -t shenriques/stupidexample:1.0 .```


```docker run -p 8080:8080 <container_id>```


