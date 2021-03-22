
# Table of Contents

1.  [This is a very  simple pod](#orgff343ca)
    1.  [Check your current namespace](#org033df1a)
    2.  [Creating a simple pod from the command line](#orgc5a7c88)
    3.  [Creating a simple pod via a yaml file](#orgda401d6)
    4.  [A pod running two containers](#org4c618f3)


<a id="orgff343ca"></a>

# This is a very  simple pod


<a id="org033df1a"></a>

## Check your current namespace

Before creating objects in OpenShift or Kubernetes you should check
the current namespace that you are using

    oc project


<a id="orgc5a7c88"></a>

## Creating a simple pod from the command line

    oc run -i -t ubi --image=registry.redhat.io/ubi8/ubi:8.3 --restart=Never

-i &#x2026; run interactivly
-t &#x2026; allocate a terminal

When finished delete the pod with

    oc delete pod ubi


<a id="orgda401d6"></a>

## Creating a simple pod via a yaml file

create the simple pod with

    oc create -f simple-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="org4c618f3"></a>

## A pod running two containers

Take a look at advanced-pod.yml. Explain what you see.

    oc create -f advanced-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.
