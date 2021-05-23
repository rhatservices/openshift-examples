
# Table of Contents

1.  [A full example for exposing an applictation](#orgabcb81c)
    1.  [Create a configmap using index.html](#orge26f1ce)
    2.  [Create a new deployment using nginx](#orgcef48b1)
    3.  [Create a service for nginx](#orgbd2ba5f)
    4.  [Expose the service](#orgb0587f9)
    5.  [Expose the service via a SSL edge terminating route](#org16900b1)
    6.  [Cleanup](#org5609c65)


<a id="orgabcb81c"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="orge26f1ce"></a>

## Create a configmap using index.html

We also label the configmap with <span class="underline">openshift-example=true</span>

    oc create configmap index --from-file=index.html
    oc label configmap index openshift-example=yes


<a id="orgcef48b1"></a>

## Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?

Test the deployment with curl and oc port-forward

    oc port-forward deployment/nginx-deployment 80<conschul-id>:8080
    curl localhost:8080


<a id="orgbd2ba5f"></a>

## Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

    oc create -f curl-pod.yml

What happens if you modify the configmap and curl the service again?


<a id="orgb0587f9"></a>

## Expose the service

    oc expose svc nginx

What kind of resource gets created?

    oc get route


<a id="org16900b1"></a>

## Expose the service via a SSL edge terminating route

    oc create route edge nginx-ssl --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?

    oc get route


<a id="org5609c65"></a>

## Cleanup

Delete all resources created:

    oc delete deployment nginx-deployment
    oc delete pod curl-pod
    oc delete route nginx nginx-ssl
    oc delete svc nginx
