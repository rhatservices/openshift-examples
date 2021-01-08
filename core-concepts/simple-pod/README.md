
# Table of Contents

1.  [This is a very  simple pod](#org1d3d66e)
    1.  [Check your current namespace](#orgae19c52)
    2.  [Creating a simple pod](#org5d386c2)


<a id="org1d3d66e"></a>

# This is a very  simple pod


<a id="orgae19c52"></a>

## Check your current namespace

Before creating objects in OpenShift or Kubernetes you should check
the current namespace that you are using

    oc project

or with kubectl

    kubectl config view --minify --output 'jsonpath={..namespace}{"\n"}'


<a id="org5d386c2"></a>

## Creating a simple pod

create the simple pod with

    oc create -f simple-pod

run

    oc get pods

to the list of running pods in the current namespace
