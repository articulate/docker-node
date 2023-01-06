#!/bin/bash -e
npm link aws-sdk
/entrypoint.sh "$@"
