#!/bin/bash

#
# Script to create Kubernetes secrets from local .env file
# Also creates a secret to the docker registry

export $(grep -v '^#' .env | xargs)

kubectl create secret generic example-secrets --from-env-file=.env -n example-ns
kubectl create secret docker-registry regcred --docker-server=${REGISTRY_SERVER} --docker-username=${REGISTRY_USER} --docker-password=${REGISTRY_PASS} -n example-ns