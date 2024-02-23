# spring-petclinic-kube-deploy

kubectl create namespace petclinic
helm upgrade --install spring-petclinic . --namespace=petclinic --wait --timeout=400s --set nameSuffix=ignore

