# doc

# ingress
https://docs.microsoft.com/en-us/azure/aks/ingress-basic?tabs=azure-cli

# download
```
curl -o qiyuesuo.package.BJBMW.20220623.tar.gz https://qiyuesuo-plm.obs.cn-east-3.myhuaweicloud.com:443/projects/BJBMW/qiyuesuo.package.BJBMW.20220623.tar.gz?AccessKeyId=JHII6IQQ9JLKYP5SGBVO&Expires=1656065389&Signature=gin7jdAhQbnds3FMbyvvwWMV5AA%3D
```


# login registry
```
az acr login --name echopdevecwur.azurecr.cn
```

# build

```
docker build -t echopdevecwur.azurecr.cn/qiyuesuo ./
docker build -t echopdevecwur.azurecr.cn/qiyuesuo -f Dockerfile ./
docker push echopdevecwur.azurecr.cn/qiyuesuo
```

* hazelcast
```
mvn package
docker build -t jinxiaolu/hazelcast ./
docker push jinxiaolu/hazelcast
docker pull jinxiaolu/hazelcast
docker tag jinxiaolu/hazelcast echopdevecwur.azurecr.cn/hazelcast
docker push echopdevecwur.azurecr.cn/hazelcast
```

# config map 
```
kubectl create configmap cm-default --from-env-file=application.properties --namespace bmw
kubectl create configmap cm-default --from-file=application.properties --namespace bmw
kubectl delete configmap cm-default --namespace bmw
```

# deploy
```
kubectl apply -f oss.yaml --namespace bmw
kubectl delete -f oss.yaml --namespace bmw
kubectl apply -f nacos-mysql.yaml -n bmw
kubectl apply -f config-pvc.yaml -n bmw
```

# ingress
```
kubectl apply -f oss-ingress.yaml --namespace bmw
kubectl apply -f oss-host-ingress.yaml --namespace bmw
kubectl get ingress -n bmw
```

az acr check-health --name <myregistry> --ignore-errors --yes
az acr check-health --name qiyuesuo.azurecr.io --ignore-errors --yes

# cmd

CMD ["java", "-Dloader.path=/app/libs", "-jar", "run.jar"]

java -Xms1024m -Xmx1024m -Dloader.path=/opt/qiyuesuo/libs -XX:+PrintGCDetails -Xloggc:/opt/qiyuesuo/logs/gc/privoss.log -XX:+PrintGCDateStamps -XX:-OmitStackTraceInFastThrow -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=production -Dqiyuesuo.logdir=/opt/qiyuesuo/logs -Dqiyuesuo.cluster.members=127.0.0.1 -jar /opt/qiyuesuo/privoss.jar

java -Xms1024m -Xmx1024m -Dloader.path=/opt/qiyuesuo/libs -XX:+PrintGCDetails -Xloggc:/opt/qiyuesuo/logs/gc/privoss.log -XX:+PrintGCDateStamps -XX:-OmitStackTraceInFastThrow -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=production -Dqiyuesuo.logdir=/opt/qiyuesuo/logs -Dqiyuesuo.cluster.members=127.0.0.1 -jar /opt/qiyuesuo/privoss.jar

java -Dspring.profiles.active=production -Dqiyuesuo.logdir=./logs -DeurekaServer=http://192.168.62.16:7000/eureka/ -jar ./target/middleware.jar

# test

eocker run --name qiyuesuo -itd qiyuesuo.azurecr.io/single bash
docker exec -it qiyuesuo /bin/bash

kubectl exec -it -n bmw oss-pod -- /bin/bash

kubectl logs -f -n bmw <pod-id> -c istio-initcp
	
curl http://10.86.26.134 -H "X-Forwarded-For: 1.1.1.1" -H "Host: oss.echopdev.echop-dev.azurechina.cloud.bmw"
