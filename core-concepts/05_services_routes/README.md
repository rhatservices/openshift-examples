
# Table of Contents

1.  [A full example for exposing an applictation](#orga8de43e)
    1.  [Create a configmap using index.html](#org03bdc3a)
    2.  [Create a new deployment using nginx](#org63e90e6)
    3.  [Create a service for nginx](#org9f3291c)
    4.  [Expose the service](#orgf9f5411)
    5.  [Expose the service via a SSL edge terminating route](#orgb63f55b)
    6.  [Cleanup](#org09136ec)


<a id="orga8de43e"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="org03bdc3a"></a>

## Create a configmap using index.html

    oc create configmap index --from-file=index.html


<a id="org63e90e6"></a>

## Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?

Test the deployment with curl and oc port-forward

    oc port-forward deployment/nginx-deployment 80<conschul-id>:8080
    curl localhost:8080


<a id="org9f3291c"></a>

## Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

    oc create -f curl-pod.yml

What happens if you modify the configmap and curl the service again?


<a id="orgf9f5411"></a>

## Expose the service

    oc expose svc nginx

What kind of resource gets created?

    oc get route


<a id="orgb63f55b"></a>

## Expose the service via a SSL edge terminating route

    oc create route edge nginx-ssl --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?

    oc get route


<a id="org09136ec"></a>

## Cleanup

Delete all resources created:

    oc delete deployment nginx-deployment
    oc delete pod curl-pod
    oc delete route nginx nginx-ssl
    oc delete svc nginx
