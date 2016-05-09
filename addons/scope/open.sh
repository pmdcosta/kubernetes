kubectl port-forward $(kubectl get pod --selector=provider=weave-scope-app -o jsonpath={.items..metadata.name}) 4040
