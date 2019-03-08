#!/bin/sh

set -xeo pipefail

# https://github.com/coreos/ignition/blob/master/doc/development.md#development
go get -u github.com/idubinskiy/schematyper
go get -u github.com/Masterminds/glide
go get -u github.com/sgotti/glide-vc

