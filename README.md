# smithy-playground

A mostly docker based repository to play around with Smithy.

## Installation

Once you pull this repository down, you'll have everything you need to launch a Smithy playground under Docker. Of course, you're going to need Docker to get this done.

## Running

Once you have the code, to build a Docker image, run `docker build -t smithy-playground .`.

Once you have an image built, you can then run the docker container by running `docker run -it --rm --name smithy-test smithy-playground`.

Once you're in the container, you'll be taken to the shell with the `pwd` set to the root of the gradle application. The Smithy models will be in a folder called `model`.

## References

- [Smithy Docs](https://awslabs.github.io/smithy/index.html)
