# Docker Compose - MIcrosoft SQL Server

We have Mailhog and ColdFusion running - now we need a database.

There are Docker images available for all of the major databases out there.  In
this example I'll use Microsoft SQL Server.  This is neat because in the case
SQL Server is running on Linux, within a Docker container.

We'll add a new service section to our docker-compose.yml file:

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

  mssql:
    container_name: mssql
    image: mcr.microsoft.com/mssql/server:2017-latest
    volumes:
      - mssql_server_data:/var/opt/mssql/data
      - ${PWD}/database-backups:/var/opt/mssql/backups
    environment:
      SA_PASSWORD: 'Your_password123'
      ACCEPT_EULA: 'Y'
      MSSQL_PID: 'Developer'
    networks:
      local:
    ports:
      - '1433:1433'

volumes:
  mssql_server_data:


networks:
  local:
    driver: bridge

```

You'll see the same things we configured in the ColdFusion service:

- We created two volumes - one will allow us to persist our data when will kill our MSSQL container. The other
will allow us to place .bak files on our local drive and restore them within the container
- We set several environment variables to configure MSSQL Server
- We expose port 1433 so we can access MSSQL server via our host

Run this using 'docker compose up':

```
docker compose up
```

Again you should be able to watch Mailhog and then the CFML service start and notice we are running a query in ColdFusion to pull data from MSSQL!

Now start Azure Data Studio and let's create a new connection to our MSSQL server running in Docker:

1. Click "Create a connection" which appears on the opening screen
2. Server: localhost
3. Authentication type: SQL Login
4. Username: SA
5. Password: Your_password123   (see our environment variables in our docker-compose.yml file)
6. Click 'Remember password'
7. You may get a warning about the certificate - click "Trust certificate" and it should connect

At this point you should be connected to the MSSQL database and can browse databases within the Docker container!

You can also backup and restore data using the /database-backups:/var/opt/mssql/backups mapping we created above.

Within Azure Data Studio create a backup and save it in /var/opt/mssql/backups.
If you look in /database-backups you should see your .bak file!

And if you visit [http://localhost:8080/index.cfm](http://localhost:8080/index.cfm)

You should see dynamic data from MSSQL!

To stop things hit CTRL+C.

