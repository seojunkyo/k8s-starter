Kubernetes Starter Project
==========================

Simple Kubernetes starter template for FastAPI developers.

# Instructions

### 1. Setup `sample` namespace
  ```
  $ cd k8s
  $ ./setup.sh
  ```

### 2. Build your own `sample-service` image.

- `build.sh`: Build docker image.
- `push.sh` : Build & push docker image.
- `debug.sh` : Debug generated docker image with a temporary container.
  - `debug.sh` : Start a temporary container with shell prompt.
  - `debug.sh <command>` : Start a temporary container with the given command`
  - `DB_HOST=<ip or host> DB_TYPE=<default:mysql|pgsql> debug.sh python -m sample.dbtest` 
     : Start a temporary container for db test.
    - e.g) `DB_HOST=10.152.183.22 ./debug.sh uvicorn sample.main:app --port=5678 --host=0.0.0.0`
      ```
      $ curl http://localhost:5678
      {"detail":"Not Found"}
      ```

# Debugging Tips

How to check network configuration at the running pod?

Check the following scripts...

```
$ kubectl get pods -A
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
ingress       nginx-ingress-microk8s-controller-bpq7l   1/1     Running   1          5h48m
kube-system   coredns-588fd544bf-zc7lj                  1/1     Running   2          6h56m
sample        mysql-64f64cdf8-nn7bt                     1/1     Running   0          155m
sample        pgsql-75f8f69bcf-477gl                    1/1     Running   0          156m
sample        sample-api-5f67767bbf-s78tb               0/1     Error     4          4m58s

$ kubectl exec -it -n sample mysql-64f64cdf8-nn7bt -- /bin/bash
root@mysql-64f64cdf8-nn7bt:/# exit
exit
(base) ~/project/k8s-starter/k8s$ kubectl exec -it -n sample pgsql-75f8f69bcf-477gl -- /bin/bash
bash-5.0# nslookup mysql.sample.svc.cluster.local
Server:		10.152.183.10
Address:	10.152.183.10:53


Name:	mysql.sample.svc.cluster.local
Address: 10.152.183.22
```
