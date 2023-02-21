# Hello Docker

We'll start with the simple hello world example though we'll run it from WITHIN Docker!

See: [https://hub.docker.com/_/hello-world](https://hub.docker.com/_/hello-world)

Run:

```
docker run hello-world
```

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

Now we can do

```
docker image ls
```

This will list your images - and you should now have an image named 'hello-world'.
