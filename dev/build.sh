#!/usr/bin/env bash
docker buildx build . --network host -t dev 
