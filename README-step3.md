# Docker-compose files

But can we set up a network of containers running together in a simple way?

## docker-compose.yml

We can chain many services into a docker-compose.yml.
Let's try doing one for our node app.

We're going to need to structure our files like this

on the root of our project we are going to put a folder called app that contains 
our nodejs app. Also in root we're going to create a docker-compose.yml file.

And we're going to specify its contents like this

```yaml
version: '3.9'
services:
  redis: 
    image: 'redis:alpine'
    ports:
      - '6379:6379'
  my_app:
    build: ./app
    ports:
    - '8080:8080'
    depends_on:
      - redis
```

This is a simple way of getting two images working together. One image 
is build from the previous Dockerfile we created. The other one is redis
which needs to be downloaded from the docker hub if we don't have it yet.

Now we need to add redis dependency to our composer.json 

```json

"dependencies": {
  
  "redis": "3.1.2"
}

```

And in our index.js we're going to add a simple visit counter. 

```js
  const redis = require('redis');
  const redisClient = redis.createClient({
    host: 'redis',
    port: 6379
  });
  
  app.get('/count', function(req, res) {
    redisClient.get('numVisits', function (error, numVisits) {
      numVisitsToDisplay = parseInt(numVisits) + 1;
      if ( isNaN(numVisitsToDisplay) ) {
        numVisitsToDisplay = 1;
      }
      res.send('Number of visits is:' + numVisitsToDisplay);
      numVisits++;
      redisClient.set('numVisits', numVisits);
    });
  });
  /* ... */
```

### But I don't wanna restart my container everytime I change my app

## Enter Volumes

I get it, freaking thing sucks to have an app, do some changes
and restart the container again. Lucky for you, we can set volumes on 
our containers. They bridge the location inside the container with your
specified directory. Let's try it.


```yaml
version: '3.9'
services:
  redis: 
    image: 'redis:alpine'
    ports:
      - '6379:6379'
  my_app:
    image: 'node:19-alpine'
    ports:
    - '8080:8080'
    volumes: 
      - ./app:/home/node/app
    working_dir: /home/node/app
    command:
      sh -c 'npm i && npm start'
    depends_on:
      - redis
```

This creates us a volume but we still need nodemon to detect changes and restart the server
automatically in our browser. 

for that we change the command instruction to this.

```
  command: sh -c 'npm init -y && npm i express redis nodemon && npx nodemon index.js'
```
this will instruct npm to install express, redis and nodemon and run index.js through nodemon

Nodemon is a daemon that monitors our files and restarts the server everytime the files are 
changed. Since we mounted a volume to our files, we don't need to restart our container
everytime we have changes in our application.


There's plenty more we can do. Connect databases, mailhog, cache.
And then there's Kubernetes which is quite a load itself.



I hope you guys liked this session, thank you for your time.
