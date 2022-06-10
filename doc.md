# doc

# ingress
https://docs.microsoft.com/en-us/azure/aks/ingress-basic?tabs=azure-cli

# download
```
curl -o qiyuesuo.package.BJBMW.20220606.tar.gz https://qiyuesuo-plm.obs.cn-east-3.myhuaweicloud.com:443/projects/BJBMW/qiyuesuo.package.BJBMW.20220606.tar.gz?AccessKeyId=JHII6IQQ9JLKYP5SGBVO&Expires=1654683891&Signature=5pJtlmORk4VTmeejcg9GuGqGClw%3D
```

# login registry
```
az acr login --name echopdevecwur.azurecr.cn
```

# build

```
docker build -t echopdevecwur.azurecr.cn/qiyuesuo ./
docker build -t echopdevecwur.azurecr.cn/qiyuesuo -f Dockerfile ./
docker build -t qiyuesuo.azurecr.io/single -f single-Dockerfile ./
docker push echopdevecwur.azurecr.cn/qiyuesuo
docker push qiyuesuo.azurecr.io/single
```

# deploy
```
kubectl apply -f oss.yaml --namespace bmw
kubectl delete -f oss.yaml --namespace bmw
```

# ingress
```
kubectl apply -f oss-ingress.yaml -namespace bmw
```

az acr check-health --name <myregistry> --ignore-errors --yes
az acr check-health --name qiyuesuo.azurecr.io --ignore-errors --yes

# cmd

CMD ["java", "-Dloader.path=/app/libs", "-jar", "run.jar"]

java -Xms512m -Xmx768m -Dloader.path=/opt/qiyuesuo/libs -XX:+PrintGCDetails -Xloggc:/opt/qiyuesuo/logs/gc/privoss.log -XX:+PrintGCDateStamps -XX:-OmitStackTraceInFastThrow -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=production -Dqiyuesuo.logdir=/opt/qiyuesuo/logs -Dqiyuesuo.cluster.members=127.0.0.1 -jar /opt/qiyuesuo/privoss.jar

java -Xms1024m -Xmx1024m -Dloader.path=/opt/qiyuesuo/libs -XX:+PrintGCDetails -Xloggc:/opt/qiyuesuo/logs/gc/privoss.log -XX:+PrintGCDateStamps -XX:-OmitStackTraceInFastThrow -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=production -Dqiyuesuo.logdir=/opt/qiyuesuo/logs -Dqiyuesuo.cluster.members=127.0.0.1 -jar /opt/qiyuesuo/privoss.jar

java -Xloggc:/opt/qiyuesuo/logs/gc/privoss.log -Dspring.profiles.active=production -Dqiyuesuo.logdir=/opt/qiyuesuo/logs -Dqiyuesuo.cluster.members=127.0.0.1 -jar /opt/qiyuesuo/privoss.jar

# test

eocker run --name qiyuesuo -itd qiyuesuo.azurecr.io/single bash
docker exec -it qiyuesuo /bin/bash
