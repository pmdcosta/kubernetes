# kubernetes on CoreOS

This repo is inspired by the [official guide](https://coreos.com/kubernetes/docs/latest/getting-started.html) for deploying [Kubernetes](http://kubernetes.io/) on a [CoreOS](https://coreos.com/) cluster.

The repo contains ansible playbooks/roles for the creation of a new Kubernetes cluster, as well as adding new nodes. The target of this deployment is a DigitalOcean cluster using CoreOS droplets, communicating using the DO internal network, as well as exposing services to the public network. The ansible host can be either inside or outside of the DO internal network.
Althougth the deployment is directed at DigitalOcean, it can easily be used in other cloud providers/bare metal, with a few changes(mainly regarding the internal network configuration).

## Cluster
The playbooks will:

- Configure an etcd cluster for Kubernetes to use
- Generate the required certificates for communication between Kubernetes components
- Deploy a master node
- Deploy worker nodes
- Configure kubectl to work with the cluster
- Deploy the additional add-ons, such as DNS
- The communication between the CoreOS, Kubernetes, and etcd services will be encrypted and authenticated

## Usage
Only works on CoreOS version 962.0.0+.

- Start by creating/provisioning the machines/vms.
- Record the address' of the master machine, and add them to group_vars and the inventory.
- Record the address' of the worker machines, and add them to the inventory.
- Run ansible/setup.sh to deploy the cluster.
- After the cluster is deployed, the roles master and node will contain the ca and admin certificates and keys in their files dir.
- Move the certificates to the kubectl dir, edit setup.sh with the correct address and run it.
- The cli kubectl is now configured and can be used to access the cluster.

Addons:

- After setting up the cluster, the addons can be deployed using kubectl.
- Simply run kubectl create -f <addon.yaml> on the addons directory
- DNS will be deployed, and does not need configuring.
- The dashboard will be deployed, but to access it run: kubectl proxy --port=9090
- To access the dashboard go to http://localhost:9090/ui


## Increasing the cluster
In order to add more nodes to the cluster, simply create a new inventory file, with the address of the new nodes. The CA certificate and key of the cluster must be supplied in the node/files directory.

## TODO
- Refactor playbooks
