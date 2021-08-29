#!/usr/bin/env bash
set -o errexit #abort if any command fails

# build
docker run --rm --name slate -v $(pwd)/build:/srv/slate/build -v $(pwd)/source:/srv/slate/source slatedocs/slate

# then run
docker run --rm --name slate -p 4567:4567 -v $(pwd)/source:/srv/slate/source slatedocs/slate serve

echo 'access it on http://localhost:4567'