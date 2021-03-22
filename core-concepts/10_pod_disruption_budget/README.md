
# Table of Contents

1.  [Pod disruption budget](#org0227779)
    1.  [Cleanup](#org06e89f1)


<a id="org0227779"></a>

# Pod disruption budget

Create the sample pod disruption budget

    oc create -f pdb.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb

Create an example pod with a label of environment=production

    oc create -f pod.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb


<a id="org06e89f1"></a>

## Cleanup

    oc delete pod pod
    oc delete pdb example-pdb
