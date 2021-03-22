
# Table of Contents

1.  [A full example for exposing an applictation](#org268fd36)
    1.  [Deploy nginx](#org9c27a91)
    2.  [Delete the pod](#orgb9a9277)
    3.  [Scale the deployment to two](#org7c455d8)


<a id="org268fd36"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="org9c27a91"></a>

## Deploy nginx

    oc apply -f nginx-deployment.yml

What additional resources does to create?


<a id="orgb9a9277"></a>

## Delete the pod

What happens if you delete the nginx pod?

    oc get pods
    oc delete pod nginx-deployment-<id>
    oc get pods


<a id="org7c455d8"></a>

## Scale the deployment to two

    oc scale --replicas=2 deployment/nginx-deployment

What is the state of the replicaset now?

How many pods are running?

    oc delete deployment nginx-deployment

What happens with dependend objects (replicaset, pods)?
