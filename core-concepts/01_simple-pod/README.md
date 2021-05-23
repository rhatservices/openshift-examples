
# Table of Contents

1.  [This is a very  simple pod](#orga3bbd1d)
    1.  [Check your current namespace](#org9c9ef90)
    2.  [Creating a simple pod from the command line](#org1fdb177)
    3.  [Creating a simple pod via a yaml file](#org7502e8b)
    4.  [A pod running two containers](#orgf160c00)
2.  [Cleanup](#orgdafaf55)


<a id="orga3bbd1d"></a>

# This is a very  simple pod


<a id="org9c9ef90"></a>

## Check your current namespace

Before creating objects in OpenShift or Kubernetes you should check
the current namespace that you are using

    oc project


<a id="org1fdb177"></a>

## Creating a simple pod from the command line

    oc run -i -t ubi --image=registry.redhat.io/ubi8/ubi:8.3 --restart=Never

-i &#x2026; run interactivly
-t &#x2026; allocate a terminal

When finished delete the pod with

    oc delete pod ubi


<a id="org7502e8b"></a>

## Creating a simple pod via a yaml file

create the simple pod with

    oc create -f simple-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="orgf160c00"></a>

## A pod running two containers

Take a look at advanced-pod.yml. Explain what you see.

    oc create -f advanced-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="orgdafaf55"></a>

# Cleanup

Execute

    ../../utils/cleanup.sh
