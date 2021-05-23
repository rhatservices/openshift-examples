
# Table of Contents

1.  [Working with quotas and limitranges](#orgc0c966a)
    1.  [Quotas](#org8e6dcb5)
    2.  [LimitRange](#orgecac0af)


<a id="orgc0c966a"></a>

# Working with quotas and limitranges


<a id="org8e6dcb5"></a>

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


<a id="orgecac0af"></a>

## LimitRange

Create a new limitrange

    oc create -f limitrange.yml

Check the state of the new limitrange

    oc describe limitranges  cpu-min-max-demo-lr

Create the deployment again and check the qosClass, what do you expect for the QoS class?

    oc create -f deployment.yml
    oc get pod -o jsonpath='qosClass: {.status.qosClass}{"\n"}' <pod>

Can you create a pod/deployment that uses the Guaranteed QoS class?
