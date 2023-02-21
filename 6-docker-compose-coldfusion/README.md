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

We've also exposed the same ports as we did before running the single line command as well as mapped our current directory into /app in the container.

The 'environment' lines will set a few environment variables which in this case or for using [CFConfig](https://cfconfig.ortusbooks.com/using-the-cli/env-var-overrides). We can set our CFAdmin password and also pass in our .json file for our full CFConfig file.

We have also included server.json file which gives us more granular control over our server. Here we can pass additional settings for memory, configuration, etc.


Run this using 'docker compose up':

```
docker compose up
```

Again you should be able to watch Mailhog and then the CFML service start.

Now verify they are working:

- ColdFusion administrator:  [http://localhost:8080/CFIDE/administrator](http://localhost:8080/CFIDE/administrator)
- Application: [http://localhost:8080](http://localhost:8080)

To stop things hit CTRL+C.

Next we'll add Microsoft SQL Server and wire everything together.
