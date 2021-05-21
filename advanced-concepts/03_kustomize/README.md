
# Table of Contents

1.  [Kustomize basics](#org4b3d161)
    1.  [Overlays](#org3bf09ba)


<a id="org4b3d161"></a>

# Kustomize basics

Apply the base application

    oc apply -k base/

Use curl to test the deployed nginx instance

    curl nginx-nginx.apps.ocp.lan.stderr.at


<a id="org3bf09ba"></a>

## Overlays

Apply the overlay hello-conschul

    oc apply -k overlays/hello-consul/

What is the status of the nginx pods?

What happens if you use curl to test the application again?
