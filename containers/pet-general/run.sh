#!/bin/bash

podman run --privileged --net=host --name pet -v $(pwd):$(pwd) -v $GOPATH:$GOPATH -ti pet
