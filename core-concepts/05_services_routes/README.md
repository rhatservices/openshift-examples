
# Table of Contents

1.  [A full example for exposing an applictation](#orgefe39d1)
    1.  [Step 1: Create a configmap using index.html](#orgfd107fc)
    2.  [Step 2: Create a new deployment using nginx](#orgde24ab2)
    3.  [Step 3: Create a service for nginx](#orgb70155a)
    4.  [Step 4: Expose the service](#orgd23b33b)
    5.  [Step 5: Expose the service via a SSL edge terminating route](#orgaffbc8c)


<a id="orgefe39d1"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="orgfd107fc"></a>

## Step 1: Create a configmap using index.html

    oc create configmap index --from-file=index.html


<a id="orgde24ab2"></a>

## Step 2: Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?

Test the deployment with curl and oc port-forward

    oc port-forward deployment/nginx-deployment 8080:8080
    curl localhost:8080


<a id="orgb70155a"></a>

## Step 3: Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

What happens if you modify the configmap and curl the service again?


<a id="orgd23b33b"></a>

## Step 4: Expose the service

    oc expose svc nginx

What kind of resource gets created?


<a id="orgaffbc8c"></a>

## Step 5: Expose the service via a SSL edge terminating route

    oc create route edge ssl-nginx --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?
