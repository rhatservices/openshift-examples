
# Table of Contents

1.  [Prerequisites](#org18db7a9)
2.  [Working with quotas and limitranges](#org20c506f)
    1.  [Quotas](#org702775a)
    2.  [LimitRange](#org417625c)
3.  [Deployment of a pod in the QoS class quaranteed](#org4da9a42)
4.  [Cleanup](#org423ae88)


<a id="org18db7a9"></a>

# Prerequisites

The examples in this section require that project admins are allowed
to edit resourcequotas and limitranges. In a default OpenShift
installation this is not allowed.

Apply the <span class="underline">quote-edit-role.yml</span> role to the cluster, this requires
cluster:admin permissions.


<a id="org20c506f"></a>

# Working with quotas and limitranges


<a id="org702775a"></a>

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


<a id="org417625c"></a>

## LimitRange

First let's remove the deployment created in the example above

    oc delete deployment -l app=quota-test

Create a new limitrange

    oc create -f limitrange.yml

Check the state of the new limitrange

    oc describe limitranges  cpu-min-max-demo-lr

Create the deployment again and check the qosClass, what do you expect for the QoS class?

    oc create -f deployment.yml
    oc get pod -o jsonpath='qosClass: {.items[0].status.qosClass}{"\n"}' -l app=quota-test

Can you create a pod/deployment that uses the Guaranteed QoS class?


<a id="org4da9a42"></a>

# Deployment of a pod in the QoS class quaranteed

Create the following deployment

    oc create -f deployment-quaranteed.yml

Check the QoS class with

    oc get pod -o jsonpath='qosClass: {.items[0].status.qosClass}{"\n"}' -l app=quota-test-quaranteed


<a id="org423ae88"></a>

# Cleanup

Execute:

    ../../utils/cleanup.sh
