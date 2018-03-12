# Kubernetes Templates for OISP

## Introduction

This project contains a collection of Kubernetes templates and some helper scripts for deploying the Open IoT Service Platform to a Kubernetes cluster.

## Requirements

 - Kubernetes 1.9
 - Persistent Storage (accessible through PersistentVolumeClaims)
 - Ability to bind to port 80 and 443 on a master node

## Usage

The templates directory contains templates for all required objects. You will want to edit the configmap and secrets to set up SMTP details and define secure and unique passwords. You will also want to update the secrets with generated public and private keys for encoding the JWTs used for authentication.

Once the configmap has been configured, you can run the templates in the following order:

1. ConfigMaps
2. Secrets
3. PersistentVolumeClaims
4. Services
5. Deployments.

These can be run using `kubectl -n <namespace> create -f templates/<type>`.

Alternatively you can run `./import.sh <namespace>` to import them all in the correct order to the specified namespace.

The stack will take around 5 minutes to deploy, you can monitor the progress in the logs for the dashboard pod. Once the stack is up and serving content. Once it is up, you can vist the IP address of the master on port 80 and it will load the IoT frontend.

If your cluster has multiple masters, you will need to use the correct IP for the master you're using. This will be resolved when it is moved to a proper ingress controller.

## Limitations

 - Websockets and HTTP are running on the same port on the same container, further configuration of an ingress controller is required to support this, so for now the stack runs nginx binding to 443 and 80 on the master node. You can adjust this as required by editing the `nginx` deployment.

## Future Work and Improvements

 - Update the dashboard to split out websockets and HTTP from the same hostname/path, to easily allow standard Ingress controllers to separate and route the traffic.
 - Publish docker images under a separate OISP namespace in DockerHub.
 - Move the config from a JSON structure inside the configmap to properly defined key-value pairs in the ConfigMap.
 - Produce a helm chart from the templates.