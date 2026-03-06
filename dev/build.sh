#!/bin/bash
docker buildx build . --network host -t soberdev 
# --no-cache
