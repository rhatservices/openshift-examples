
# Table of Contents

1.  [A full example for exposing an applictation](#orgc8975cb)
    1.  [Create a configmap using index.html](#org2b37e2d)
    2.  [Create a new deployment using nginx](#org8e225ea)
        1.  [Test the deployment with curl and oc port-forward.](#org04be95c)
    3.  [Create a service for nginx](#orgdb62d88)
    4.  [Expose the service](#orga3fbdca)
    5.  [Expose the service via a SSL edge terminating route](#org5d7ccc2)
    6.  [Cleanup](#org3b28082)


<a id="orgc8975cb"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="org2b37e2d"></a>

## Create a configmap using index.html

We also label the configmap with <span class="underline">openshift-example=true</span>

    oc create configmap index --from-file=index.html
    oc label configmap index openshift-example=yes


<a id="org8e225ea"></a>

## Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?


<a id="org04be95c"></a>

### Test the deployment with curl and oc port-forward.

When you start <span class="underline">oc port-forward</span> will just sit there with no output
and forwards the port. For running the second <span class="underline">curl</span> command open a
second shell on the **same** machine where <span class="underline">oc port-foward</span> is
running (or move the command to the background).

    export PORT="80$(( $RANDOM % 89 + 10))"
    oc port-forward deployment/nginx-deployment $PORT:8080
    curl localhost:$PORT


<a id="orgdb62d88"></a>

## Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

    oc create -f curl-pod.yml

What happens if you modify the configmap and curl the service again?


<a id="orga3fbdca"></a>

## Expose the service

    oc expose svc nginx

What kind of resource gets created?

    oc get route


<a id="org5d7ccc2"></a>

## Expose the service via a SSL edge terminating route

    oc create route edge nginx-ssl --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?

    oc get route


<a id="org3b28082"></a>

## Cleanup

Delete all resources created:

    oc delete deployment nginx-deployment
    oc delete pod curl-pod
    oc delete route nginx nginx-ssl
    oc delete svc nginx
