
# Table of Contents

1.  [A full example for exposing an applictation](#org86ec0ac)
    1.  [Create a configmap using index.html](#orga219d0f)
    2.  [Create a new deployment using nginx](#orgc019bf4)
        1.  [Test the deployment with curl and oc port-forward.](#org362e1cf)
    3.  [Create a service for nginx](#org2b96bad)
    4.  [Expose the service](#org157f614)
    5.  [Expose the service via a SSL edge terminating route](#org6fa1e24)
    6.  [Cleanup](#orgad10220)


<a id="org86ec0ac"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="orga219d0f"></a>

## Create a configmap using index.html

We also label the configmap with <span class="underline">openshift-example=true</span>

    oc create configmap index --from-file=index.html
    oc label configmap index openshift-example=yes


<a id="orgc019bf4"></a>

## Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?


<a id="org362e1cf"></a>

### Test the deployment with curl and oc port-forward.

When you start <span class="underline">oc port-forward</span> will just sit there with no output
and forwards the port. For running the second <span class="underline">curl</span> command open a
second shell on the **same** machine where <span class="underline">oc port-foward</span> is
running (or move the command to the background).

    export PORT="80$(( $RANDOM % 89 + 10))"
    oc port-forward deployment/nginx-deployment $PORT:8080
    curl localhost:$PORT


<a id="org2b96bad"></a>

## Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

    oc create -f curl-pod.yml

What happens if you modify the configmap and curl the service again?


<a id="org157f614"></a>

## Expose the service

    oc expose svc nginx

What kind of resource gets created?

    oc get route

Try to access the nginx application via the route

    curl -v $(oc get route nginx -o jsonpath={.spec.host})


<a id="org6fa1e24"></a>

## Expose the service via a SSL edge terminating route

    oc create route edge nginx-ssl --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?

    oc get route

Try to access the nginx application via the encrypted route

    curl -kv https://$(oc get route nginx-ssl -o jsonpath={.spec.host})


<a id="orgad10220"></a>

## Cleanup

Delete all resources created:

    ../../utils/cleanup.sh
