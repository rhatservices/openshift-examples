
# Table of Contents

1.  [Prerequisites](#org645b0cf)
2.  [Working with quotas and limitranges](#org43c0b04)
    1.  [Quotas](#org0f42719)
    2.  [LimitRange](#org7ea6ecc)


<a id="org645b0cf"></a>

# Prerequisites

The examples in this section require that project admins are allowed
to edit resourcequotas and limitranges. In a default OpenShift
installation this is not allowed.

Apply the <span class="underline">quote-edit-role.yml</span> role to the cluster, this requires
cluster:admin permissions.


<a id="org43c0b04"></a>

# Working with quotas and limitranges


<a id="org0f42719"></a>

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


<a id="org7ea6ecc"></a>

## LimitRange

Create a new limitrange

    oc create -f limitrange.yml

Check the state of the new limitrange

    oc describe limitranges  cpu-min-max-demo-lr

Create the deployment again and check the qosClass, what do you expect for the QoS class?

    oc create -f deployment.yml
    oc get pod -o jsonpath='qosClass: {.status.qosClass}{"\n"}' <pod>

Can you create a pod/deployment that uses the Guaranteed QoS class?
