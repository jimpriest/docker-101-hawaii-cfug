# HELP

This will be confusing if you haven't used Docker before but below are some
helpful commands if you get stuck.

## Your Host Computer - Windows vs Mac vs Linux

I created these demos on a Linux machine.  Docker is cross compatible as are all
the tools I'll be using in the demos but you may need to tweak things due to
differences in the various operating systems.

## Already Running Container

You may see a message about a container already in use: "The container name "/mailhog" is already in use by container"

To quickly see running containers type:

```
docker ps

CONTAINER ID   IMAGE             COMMAND     CREATED          STATUS          PORTS       NAMES
882e6d3a63fa   mailhog/mailhog   "MailHog"   12 minutes ago   Up 12 minutes   0.0.0.0:1025->1025/tcp, :::1025->1025/tcp, 0.0.0.0:8025->8025/tcp,:::8025->8025 tcp   mailhog
```

The important bit here is the "CONTAINER ID"

To quickly fix this you can remove that container:

```
docker kill 882e6
```

Kill will stop and remove the container.


## Docker Prune Things

While building images, etc. Docker create a lot of temporary information - layers,
networks, temp images etc. These can build up over time and depending on the images
take up a lot of disk space.  Docker provides the 'prune' command to help clean these up:


```
docker image prune
docker container prune
docker volume prune
```

You can also do all of these at once:

```
docker system prune

WARNING! This will remove:
  - all stopped containers
  - all networks not used by at least one container
  - all dangling images
  - all dangling build cache
```

This is helpful if you get stuck and just need to quickly reset.

## Removing Images

If you are done experimenting remember you can also list and remove images you
are no longer using:

```
docker image ls
```

And to remove:

```
docker image rm ubuntu

Untagged: ubuntu:latest
Untagged: ubuntu@sha256:9a0bdde4188b896a372804be2384015e90e3f84906b750c1a53539b585fbbe7f
Deleted: sha256:58db3edaf2be6e80f628796355b1bdeaf8bea1692b402f48b7e7b8d1ff100b02
```

## Case Sensitivity

If you are coming from a Windows or Mac environment - remember within Docker
you are usually interacting with a Linux environment and Linux is case SENSITIVE!

So if you name a file Index.cfm and are getting messages about
 file not found - it may be looking for index.cfm.

