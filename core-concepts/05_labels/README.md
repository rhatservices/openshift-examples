
# Table of Contents

1.  [Labels and annotations](#orgb839da4)


<a id="orgb839da4"></a>

# Labels and annotations

    oc create -f .

    oc get pods -l app=label-test
    oc get pods -l environment=production
    oc get pods -l 'environment in (production, development)'
