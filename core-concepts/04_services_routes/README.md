
# Table of Contents

1.  [A full example for exposing an applictation](#org8f90555)
    1.  [Step 1: Create a configmap using index.html](#org2aac846)
    2.  [Step 2: Create a new deployment using nginx](#org5998ebb)
    3.  [Step 3: Create a service for nginx](#org357a77a)
    4.  [Step 4: Expose the service](#org0d0ec76)
    5.  [Step 5: Expose the service via a SSL edge terminating route](#orgab4d869)


<a id="org8f90555"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="org2aac846"></a>

## Step 1: Create a configmap using index.html

    oc create configmap index --from-file=index.html


<a id="org5998ebb"></a>

## Step 2: Create a new deployment using nginx

    oc apply -f nginx-deployment-cm.yml

What kind of resource are created?

Test the deployment with curl and oc port-forward

    oc port-forward deployment/nginx-deployment 8080:8080
    curl localhost:8080


<a id="org357a77a"></a>

## Step 3: Create a service for nginx

    oc apply -f nginx-service.yml

Can you use curl to access the service?

What happens if you modify the configmap and curl the service again?


<a id="org0d0ec76"></a>

## Step 4: Expose the service

    oc expore svc nginx

What kind of resource gets created?


<a id="orgab4d869"></a>

## Step 5: Expose the service via a SSL edge terminating route

    oc create route edge ssl-nginx --service=nginx

What kind of resource is created?

Can you take a look at the details of the resource?
