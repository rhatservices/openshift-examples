
# Table of Contents

1.  [A full example for exposing an applictation](#org7d10be1)
    1.  [Deploy nginx](#orgc2251d3)
    2.  [Delete the pod](#org1a23b17)
    3.  [Scale the deployment to two](#orgbde4be5)
2.  [Cleanup](#org0137088)


<a id="org7d10be1"></a>

# A full example for exposing an applictation

In this example we are going to deploy a pod running nginx.


<a id="orgc2251d3"></a>

## Deploy nginx

    oc apply -f nginx-deployment.yml

What additional resources does to create?


<a id="org1a23b17"></a>

## Delete the pod

What happens if you delete the nginx pod?

    oc get pods
    oc delete pods -l openshift-example=yes
    oc get pods


<a id="orgbde4be5"></a>

## Scale the deployment to two

    oc scale --replicas=2 deployment/nginx-deployment

What is the state of the replicaset now?

    oc get replicaset

How many pods are running?

    oc delete deployment nginx-deployment

What happens with dependend objects (replicaset, pods)?


<a id="org0137088"></a>

# Cleanup

Execute

    ../../utils/cleanup.sh
