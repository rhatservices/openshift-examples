
# Table of Contents

1.  [Pod disruption budget](#orgc9dfe0b)


<a id="orgc9dfe0b"></a>

# Pod disruption budget

Create the sample pod disruption budget

    oc create -f pdb.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb
