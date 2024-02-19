# spring-petclinic-kube-deploy

helm upgrade --install spring-petclinic . --namespace=int --wait --timeout=400s --set nameSuffix=ignore

