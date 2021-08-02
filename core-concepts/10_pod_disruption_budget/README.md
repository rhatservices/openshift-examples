
# Table of Contents

1.  [Pod disruption budget](#org403d345)
    1.  [Cleanup](#org040bd0c)


<a id="org403d345"></a>

# Pod disruption budget

Create the sample pod disruption budget

    oc create -f pdb.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb

Create an example pod with a label of environment=production

    oc create -f pod.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb

Create a second example pod with a label of environment=production

     oc create -f pod2.yml

Check the status of the pod disruption budget

     oc describe pdb example-pdb

<a id="org040bd0c"></a>

## Cleanup

Execute

    ../../utils/cleanup.sh
