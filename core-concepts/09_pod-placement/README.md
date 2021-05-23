
# Table of Contents

1.  [Pod affinity and anti-affinity](#org9d2ae86)
    1.  [Cleanup](#org0861ecb)


<a id="org9d2ae86"></a>

# Pod affinity and anti-affinity

Deploy a sample pod

    oc create -f pod-a.yml

Check the affinity rules of pod-b and deploy the pod

    oc create -f pod-b.yml

Should the pod be running on the same or on a different node than pod-a?

Check pod placement

    oc get pods -o wide

Check the affinity rules of pod-c and deploy the depod

    oc create -f pod-c.yml

Should the pod be running on the same or on a different node than pod-a?

Check pod placement

    oc get pods -o wide


<a id="org0861ecb"></a>

## Cleanup

Execute

    ../../utils/cleanup.sh
