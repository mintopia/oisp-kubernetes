# Kubernetes Templates for OISP

## Introduction

This project contains a collection of Kubernetes templates and some helper scripts for deploying the Open IoT Service Platform to a Kubernetes cluster.

## Requirements

 - Kubernetes 1.9
 - Persistent Storage (accessible through PersistentVolumeClaims)
 - nginx ingress controller

## Usage

The templates directory contains templates for all required objects. You will want to edit the configmap and secrets to set up SMTP details and define secure and unique passwords. You will also want to update the secrets with generated public and private keys for encoding the JWTs used for authentication.

You will also want to configure the Ingress objects to have the correct hostnames for your cluster.

Once the stack has been configured, you can run the templates in the following order:

1. ConfigMaps
2. Secrets
3. PersistentVolumeClaims
4. Services
5. Deployments
6. Ingresses

These can be run using `kubectl -n <namespace> create -f templates/<type>`.

Alternatively you can run `./import.sh <namespace>` to import them all in the correct order to the specified namespace.

The stack will take around 5 minutes to deploy, you can monitor the progress in the logs for the dashboard pod. Once the stack is up and serving content. Once it is up, you can vist the hostname specified in the ingress.

## Future Work and Improvements

 - Publish docker images under a separate OISP namespace in DockerHub.
 - Move the config from a JSON structure inside the configmap to properly defined key-value pairs in the ConfigMap.
 - Produce a helm chart from the templates.