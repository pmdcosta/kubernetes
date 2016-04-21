#!/usr/bin/env bash

MASTER_HOST=kube-master.cloud.qold.co
CA_CERT=$(pwd)/ca.pem
ADMIN_KEY=$(pwd)/admin-key.pem
ADMIN_CERT=$(pwd)/admin.pem

kubectl config set-cluster default-cluster --server=https://${MASTER_HOST} --certificate-authority=${CA_CERT}
kubectl config set-credentials default-admin --certificate-authority=${CA_CERT} --client-key=${ADMIN_KEY} --client-certificate=${ADMIN_CERT}
kubectl config set-context default-system --cluster=default-cluster --user=default-admin
kubectl config use-context default-system
