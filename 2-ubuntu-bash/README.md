# Ubuntu Bash

Next lets start an Ubuntu container.

Normally you could:

1. dual boot
2. install Ubuntu within a VM
3. use something like WSL if you are using Windows

But with Docker we can quickly spin up an Ubuntu machine anywhere!

Run:

```
docker run -it ubuntu bash
```


This will run and you will be in Ubuntu! The '-it' is short for --interactive + --tty.
To get out of the container just type 'exit' and you will be back to your host machine.

And if we look at our images again we can see 'Ubuntu' is now downloaded.

```
docker image ls
```

Since we don't need the hello-world image we can delete that easily:

```
docker image rm hello-world
```

If you get an error you can force the deletion:

```
docker image rm hello-world --force
```

To see a list of all the image commands:

```
docker image --help

Commands:
  build       Build an image from a Dockerfile
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Display detailed information on one or more images
  load        Load an image from a tar archive or STDIN
  ls          List images
  prune       Remove unused images
  pull        Download an image from a registry
  push        Upload an image to a registry
  rm          Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
```
