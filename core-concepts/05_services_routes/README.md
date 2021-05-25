
# Table of Contents

1.  [A full example for exposing an applictation](#org2e23a9c)
    1.  [Create a configmap using index.html](#org9e03447)
    2.  [Create a new deployment using nginx](#orgb053ecf)
        1.  [Test the deployment with curl and oc port-forward.](#org329b987)
    3.  [Create a service for nginx](#org0958804)
    4.  [Expose the service](#orgc347bfd)
    5.  [Expose the service via a SSL edge terminating route](#orgdccf22c)
    6.  [Cleanup](#org4262a31)


<a id="org2e23a9c"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="org9e03447"></a>

## Create a configmap using index.html

We also label the configmap with <span class="underline">openshift-example=true</span>

    oc create configmap index --from-file=index.html
    oc label configmap index openshift-example=yes


<a id="orgb053ecf"></a>

## Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?


<a id="org329b987"></a>

### Test the deployment with curl and oc port-forward.

When you start <span class="underline">oc port-forward</span> will just sit there with no output
and forwards the port. For running the second <span class="underline">curl</span> command open a
second shell on the **same** machine where <span class="underline">oc port-foward</span> is
running (or move the command to the background).

    export PORT="80$(( $RANDOM % 89 + 10))"
    oc port-forward deployment/nginx-deployment $PORT:8080
    curl localhost:$PORT


<a id="org0958804"></a>

## Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

    oc create -f curl-pod.yml

What happens if you modify the configmap and curl the service again?


<a id="orgc347bfd"></a>

## Expose the service

    oc expose svc nginx

What kind of resource gets created?

    oc get route

Try to access the nginx application via the route

    curl -v $(oc get route nginx -o jsonpath={.spec.host})


<a id="orgdccf22c"></a>

## Expose the service via a SSL edge terminating route

    oc create route edge nginx-ssl --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?

    oc get route

Try to access the nginx application via the encrypted route

    curl -kv https://$(oc get route nginx-ssl -o jsonpath={.spec.host})


<a id="org4262a31"></a>

## Cleanup

Delete all resources created:

    ../../utils/cleanup.sh
