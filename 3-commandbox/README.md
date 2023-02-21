# CommandBox

Let's see how quickly we can spin up a running Lucee server.

1. Navigate to this directory (/docker-101-hawaii-cfug/3-commandbox)
2. Note: If you run this command from a different directory you will get an error about not being able to find index.cfm!
3. Run the following:


```
docker run -p 8080:8080 -v "$PWD:/app" ortussolutions/commandbox
```

We can break this down

- -p 8080:8080  exposes port 8080 on your host to port 8080 within the container (host:container)
- -v "$PWD:/app" will map this directory with /app within the container.

Once running you should be able to visit: [http://localhost:8080/index.cfm](http://localhost:8080/index.cfm)

And see:

```
This is running in Docker
{ts '2023-02-20 19:58:26'}
```

Note if we change the text in the index.cfm and refresh the page the changes will be reflected. This
is because we are sharing a drive between our host and the container.  This is ideal for local development!


To stop this container, open another terminal and run:

```
docker ps
```

This will return a list of running containers.  Note the CONTAINER ID.

Now run:

```
docker kill (the container id)

Example:

docker kill a8ac1df8775c
```


While this works it doesn't allow us a lot of options to configure things.


We'll explore that in the next example.
