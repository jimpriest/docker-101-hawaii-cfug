# Docker Compose - ColdFusion

With Mailhog running now we can expand our docker-compose.yml file and add
some additional information to start a ColdFusion server.

Things to note - we've added a 'network'. This allows the containers to talk to
each other.  So when ColdFusion sends an email - it will be routed to the Mailhog server.

Also note that the ColdFusion service 'depends' on Mailhog. So when the CFML service
starts it will automatically start the Mailhog service as well (if it's not already running).

```
version: '3'

services:
  mailhog:
      container_name: mailhog
      image: mailhog/mailhog
      networks:
        local:
      ports:
        - '1025:1025'
        - '8025:8025'

  cfml:
    container_name: cfml
    image: ortussolutions/commandbox:adobe2018
    environment:
      cfconfig_adminPassword: password
      cfconfigfile: myconfig.json
    depends_on:
      - mailhog
    networks:
      local:
    ports:
      - "8080:8080"
    volumes:
      - ${PWD}:/app

networks:
  local:
    driver: bridge

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
visit: http://localhost:8025/ you should see the Mailhog interface.

Note this is now running the background.  To stop things run:

```
docker compose down
```

Down will stop the service and remove the container.

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

