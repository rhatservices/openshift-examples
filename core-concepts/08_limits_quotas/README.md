
# Table of Contents

1.  [Prerequisites](#orgdb6608f)
2.  [Working with quotas and limitranges](#org230eab7)
    1.  [Quotas](#org0a6fde4)
    2.  [LimitRange](#orgf706bf1)
3.  [Deployment of a pod in the QoS class quaranteed](#org1b99162)
4.  [Cleanup](#orgb959fbb)


<a id="orgdb6608f"></a>

# Prerequisites

The examples in this section require that project admins are allowed
to edit resourcequotas and limitranges. In a default OpenShift
installation this is not allowed.

Apply the <span class="underline">quote-edit-role.yml</span> role to the cluster, this requires
cluster:admin permissions.


<a id="org230eab7"></a>

# Working with quotas and limitranges


<a id="org0a6fde4"></a>

## Quotas

Create a quota

    oc create -f object-quota.yml

Take a look at the quota definition

    oc get quota

Create a new deployment

    oc create -f deployment.yml

Scale the deployment to 2 pods

    oc scale deployment --replicas=2 quota-test

Check the state of the deployment

    oc get deployment

Check the state of the quota

    oc get quota

Check events for any errors

    oc get events

Scale the deployment to 3 pods

    oc scale deployment --replicas=3 quota-test

Check the state of the deployment

    oc get deployment

Check the state of the quota

    oc get quota

Check events for any errors

    oc get events

In which quality of service class is the pod running and why is it using that particular class?

    oc get pod -o jsonpath='qosClass: {.status.qosClass}{"\n"}' <pod>


<a id="orgf706bf1"></a>

## LimitRange

First let's remove the deployment created in the example above

    oc delete deployment -l app=quota-test

Create a new limitrange

    oc create -f limitrange.yml

Check the state of the new limitrange

    oc describe limitranges  cpu-min-max-demo-lr

Delete the quota-test pods and check the qosClass, what do you expect for the QoS class?

    oc delete pods -l app=quota-test
    oc get pod -o jsonpath='qosClass: {.items[0].status.qosClass}{"\n"}' -l app=quota-test

Can you create a pod/deployment that uses the Guaranteed QoS class?


<a id="org1b99162"></a>

# Deployment of a pod in the QoS class quaranteed

Create the following deployment

    oc create -f deployment-quaranteed.yml

Check the QoS class with

    oc get pod -o jsonpath='qosClass: {.items[0].status.qosClass}{"\n"}' -l app=quota-test-quaranteed


<a id="orgb959fbb"></a>

# Cleanup

Execute:

    ../../utils/cleanup.sh
