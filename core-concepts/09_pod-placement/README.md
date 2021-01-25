
# Table of Contents

1.  [Pod affinity and anti-affinity](#org45c19b0)
2.  [Pod disruption budget](#org02f4a1a)


<a id="org45c19b0"></a>

# Pod affinity and anti-affinity

Deploy a sample pod

    oc create -f pod-a.yml

Check the affinity rules of pod-b and deploy the pod

    oc create -f pod-b.yml

Should be pod be running on the same or on a different node than pod-a?

Check pod placement

    oc get pods -o wide

Check the affinity rules of pod-c and deploy the depod

    oc create -f pod-c.yml

Should be pod be running on the same or on a different node than pod-a?

Check pod placement

    oc get pods -o wide


<a id="org02f4a1a"></a>

# Pod disruption budget

Create the sample pod disruption budget

    oc create -f pdb.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb
