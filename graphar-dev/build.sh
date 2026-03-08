#!/usr/bin/env bash
docker buildx build . --network host -t graphar-dev
