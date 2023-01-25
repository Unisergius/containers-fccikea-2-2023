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
version '3.9'
services:
  redis: 
    image: 'redis:alpine'
    ports:
      - '6379:6379'
  my_app:
    build: ./app
    ports '8080:8080'
    depends_on:
      - redis
```

This is a simple way of getting two images working together. One image 
is build from the previous Dockerfile we created. The other one is redis
which needs to be downloaded from the docker hub if we don't have it yet.

Now we need to add redis dependency to our composer.json 

```json
/* ... */
"dependencies": {
  /* ... */
  "redis": "3.1.2"
}
/* ... */
```

And in our index.js we're going to add a simple visit counter. 

```
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
