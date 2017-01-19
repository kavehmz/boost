#!/bin/bash
exec 3<&0
docker run -v ~/dev/home:/home -v ~/dev/root:/root debian_dev gpg "$@"