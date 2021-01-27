
# Table of Contents

1.  [Labels and annotations](#org5004a0e)


<a id="org5004a0e"></a>

# Labels and annotations

Create pods from all pod definitions in this folder

    oc create -f .

Query pods based on their labels

    oc get pods -l app=label-test
    oc get pods -l environment=production
    oc get pods -l 'environment in (production, development)'

Annotate a pod

    oc annotate pod pod-a foo=bar
    oc describe pod pod-a

Try to query the via the annotation

    oc get pods -l foo=bar
