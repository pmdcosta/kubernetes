#!/usr/bin/env bash

# curl -O https://storage.googleapis.com/kubernetes-release/release/v1.2.0/bin/linux/amd64/kubectl
# chmod +x kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl

rm -f ./*.pem
cp ../ansible/roles/master/files/* .
cp ../ansible/roles/node/files/* .
