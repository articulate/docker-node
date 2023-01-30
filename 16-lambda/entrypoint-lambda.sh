#!/bin/bash -e
npm link aws-sdk
exec "$@"
