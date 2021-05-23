
# Table of Contents

1.  [A full example for exposing an applictation](#org7872053)
    1.  [Create a configmap using index.html](#org850b8bd)
    2.  [Create a new deployment using nginx](#org88399d4)
        1.  [Test the deployment with curl and oc port-forward.](#org4c44394)
    3.  [Create a service for nginx](#orgaa869fc)
    4.  [Expose the service](#orgea58615)
    5.  [Expose the service via a SSL edge terminating route](#org37f2911)
    6.  [Cleanup](#orga970ef2)


<a id="org7872053"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="org850b8bd"></a>

## Create a configmap using index.html

We also label the configmap with <span class="underline">openshift-example=true</span>

    oc create configmap index --from-file=index.html
    oc label configmap index openshift-example=yes


<a id="org88399d4"></a>

## Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?


<a id="org4c44394"></a>

### Test the deployment with curl and oc port-forward.

When you start <span class="underline">oc port-forward</span> will just sit there with no output
and forwards the port. For running the second <span class="underline">curl</span> command open a
second shell on the **same** machine where <span class="underline">oc port-foward</span> is
running (or move the command to the background).

    export PORT="80$(( $RANDOM % 89 + 10))"
    oc port-forward deployment/nginx-deployment $PORT:8080
    curl localhost:$PORT


<a id="orgaa869fc"></a>

## Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

    oc create -f curl-pod.yml

What happens if you modify the configmap and curl the service again?


<a id="orgea58615"></a>

## Expose the service

    oc expose svc nginx

What kind of resource gets created?

    oc get route

Try to access the nginx application via the route

    curl -v $(oc get route nginx -o jsonpath={.spec.host})


<a id="org37f2911"></a>

## Expose the service via a SSL edge terminating route

    oc create route edge nginx-ssl --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?

    oc get route

Try to access the nginx application via the encrypted route

    curl -v https://$(oc get route nginx -o jsonpath={.spec.host})


<a id="orga970ef2"></a>

## Cleanup

Delete all resources created:

    oc delete deployment nginx-deployment
    oc delete pod curl-pod
    oc delete route nginx nginx-ssl
    oc delete svc nginx
