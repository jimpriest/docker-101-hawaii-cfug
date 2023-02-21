# Dockerfile

While running Docker via the cli works - it becomes difficult to do more advanced things.

Here we will introduce the 'Dockerfile'.  A Dockerfile can be used to build our own image.

You can install whatever you want and configure it however you like.

We can then run that image, share it with a co-worker or we could push it to a container registry so others may use it.

Building images is an advanced topic and I won't go into much detail her other than this simple example.

Navigate to this directory (/docker-101-hawaii-cfug/4-dockerfile) and run the following:


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
docker run -p 8080:8080 website
```

Notice this time we don't have to map a directory.

Within the Dockerfile we have two lines:

1. FROM tells the Docker 'from' where it should pull an existing image.  Yes, we're going to use an existing image as a base to build or own custom image.
2. COPY will copy the index.cfm file from our host into the container within the /app directory. By default Commandbox will use this /app directory as the web root.
3. Note you can no longer change the text in the file and have it appear when you refresh that browser. You would need to change the text and rebuild the image.

```
FROM ortussolutions/commandbox
COPY index.cfm /app
```

Once running you should be able to visit: [http://localhost:8080/index.cfm](http://localhost:8080/index.cfm)

And see:

```
This is running in Docker
From a file that was copied into the container.

{ts '2023-02-20 20:48:33'}
```



Next we'll look at docker-compose which allows us to easily spin up one or more images.
