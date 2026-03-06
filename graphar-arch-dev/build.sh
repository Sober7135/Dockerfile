#!/bin/bash
docker buildx build . --network host -t graphar-arch-dev --no-cache
