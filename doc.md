# doc

# login registry
```
az acr login --name echopdevecwur.azurecr.cn
```

# build

```
docker build -t echopdevecwur.azurecr.cn/single -f single-Dockerfile ./
docker push echopdevecwur.azurecr.cn/single
```

# deploy
kubectl apply -f qiyuesuo-single.yaml --namespace bmw
kubectl delete -f qiyuesuo-single.yaml --namespace bmw

az acr check-health --name <myregistry> --ignore-errors --yes
az acr check-health --name qiyuesuo.azurecr.io --ignore-errors --yes
