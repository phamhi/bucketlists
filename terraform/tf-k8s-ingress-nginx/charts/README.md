
Source:
https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/

```shell
helm3 repo add nginx-stable https://helm.nginx.com/stable
```

```shell
helm3 search repo ingress-nginx/ingress-nginx --versions|head -10
helm3 fetch ingress-nginx/ingress-nginx --version 3.23.0
```
