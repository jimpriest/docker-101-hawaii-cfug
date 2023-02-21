# Cleanup

Now that we've concluded our demo let's do some house cleaning.

First lets verify we've removed all our images:

```
docker image ls

docker image rm hello-world ubuntu mailhog/mailhog ortussolutions/commandbox ortussolutions/commandbox:adobe2018 mcr.microsoft.com/mssql/server:2017-latest foundeo/cfml-ci-tools website --force
```

We have removed our images but we may still have artifacts around we can't see.

While building images, etc. Docker create a lot of temporary information - layers,
networks, temp images etc. These can build up over time and depending on the images
take up a lot of disk space.

Docker provides the 'prune' command to help clean these up:

```
docker system prune

WARNING! This will remove:
  - all stopped containers
  - all networks not used by at least one container
  - all dangling images
  - all dangling build cache
```

This should remove everything else leaving you with a clean slate!