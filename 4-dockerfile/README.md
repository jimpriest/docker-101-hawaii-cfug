# Dockerfile

While running Docker via the cli works - it becomes more difficult to do more advanced things.

Here we will introduce the 'Dockerfile'.  A Dockerfile can be used to build our own image.

We can run that image, share it with a co-worker or we could push it to a container registry so others may use it.

This is a simple file which allows you to spin up an image and add additional configuration information.


1. Navigate to this directory and run the following:


```
docker build -t website .
```

This will build a new image. If we look we should have a new image called 'website':

```
docker image ls

REPOSITORY                  TAG       IMAGE ID       CREATED          SIZE
website                     latest    31f1cced1556   13 seconds ago   717MB
```

And now we can run our image:

```
docker run -t -p 8080:8080 website
```

Notice this time we don't have to map a directory.  Within the Dockerfile we copied our index.cfm
to the container.

```
FROM ortussolutions/commandbox
COPY index.cfm /app
```

Once running you should be able to visit: http://localhost:8080/index.cfm

And see:

```
This is running in Docker
From a file that was copied into the container.

{ts '2023-02-20 20:48:33'}
```

Building images is an advanced topic and I won't go into more here.

Next we'll look at docker-compose which allows us to easily spin up one or more images.