# CommandBox

Let's see how quickly we can spin up a running Lucee server.

1. Navigate to this directory and run the following:


```
docker run -p 8080:8080 -v "$PWD:/app" ortussolutions/commandbox
```

We can break this down

- -p 8080:8080  exposes port 8080 on your host to port 8080 within the container (host:container)
- -v "${PWD}:/app" will map this directory with /app within the container.

Once running you should be able to visit: http://localhost:8080/index.cfm

And see:

```
This is running in Docker
{ts '2023-02-20 19:58:26'}
```

While this works it doesn't allow us a lot of options to configure things.

We'll explore that in the next example.
