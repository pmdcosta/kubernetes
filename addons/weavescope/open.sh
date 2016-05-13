kubectl port-forward $(kubectl get pod --selector=weavescope-component=weavescope-app -o jsonpath={.items..metadata.name} --namespace kube-system) 4040 --namespace kube-system
