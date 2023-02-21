# Docker Compose - Mailhog

What's the differene between a Dockerfile and Docker Compose?

A Dockerfile is a simple text file that contains the commands a user could call
to build an image whereas Docker Compose is a tool for defining and running
multi-container Docker applications.

In the next few examples we'll build out an entire development environment we
can use for CFML:

- Mailhog - a SMTP server so we can test email
- ColdFusion - our Application server
- MSSQL - our database

The Docker Compose file is a simple yaml file:

```
version: '3'

services:
  mailhog:
      container_name: mailhog
      image: mailhog/mailhog
      ports:
        - '1025:1025'
        - '8025:8025'
```

Here we will pull the mailhog image and start it.  We will expose two ports:

- 1025 - which we can use in ColdFusion's SMTP settings
- 8025 - which provides a simple GUI to interact with email

Run this using 'docker compose':

```
docker compose up

[+] Running 2/2
 ⠿ Network 5-docker-compose_default Created
 ⠿ Container mailhog                 Started
 ```

You can see it started our Mailhog container and if you
visit: [http://localhost:8025/](http://localhost:8025/) you should see the Mailhog interface.

Note this is now running the background.  To stop things run:

```
docker compose down
```

'Down' will stop the service and remove the container.

You can also do:

```
docker compose stop
```

Which will just stop the service while leaving the container intact.

For a list of all the options try:

```
docker compose help

Commands:
  build       Build or rebuild services
  config      Parse, resolve and render compose file in canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service.
  down        Stop and remove containers, networks
  events      Receive real time events from containers.
  exec        Execute a command in a running container.
  images      List images used by the created containers
  kill        Force stop service containers.
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding.
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service.
  start       Start services
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information
```

In the next lesson we'll add ColdFusion!

