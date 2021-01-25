
# Table of Contents

1.  [A full example for exposing an applictation](#org8b00074)
    1.  [Step 1: Deploy nginx](#org8ae575b)
    2.  [Step 2: Scale the deployment to two](#org8e595d8)


<a id="org8b00074"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="org8ae575b"></a>

## Step 1: Deploy nginx

    oc apply -f nginx-deployment.yml

What additional resources does to create?


<a id="org8e595d8"></a>

## Step 2: Scale the deployment to two

    oc scale --replicas=2 deployment/nginx-deployment

What is the state of the replicaset now?

How many pods are running?

    oc delete deployment nginx-deployment

What happens with dependend objects (replicaset, pods)?
