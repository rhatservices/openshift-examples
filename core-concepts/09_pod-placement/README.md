
# Table of Contents

1.  [Pod affinity and anti-affinity](#orga2e4237)
    1.  [Cleanup](#org6ced2bf)


<a id="orga2e4237"></a>

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


<a id="org6ced2bf"></a>

## Cleanup

    oc delete pod-a pod-b pod-c
