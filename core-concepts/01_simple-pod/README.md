
# Table of Contents

1.  [This is a very  simple pod](#orge0c0ebf)
    1.  [Check your current namespace](#orgbe1897a)
    2.  [Creating a simple pod from the command line](#org830274e)
    3.  [Creating a simple pod via a yaml file](#org17e911d)
    4.  [A pod running two containers](#orgf97c2bf)
2.  [Cleanup](#org998b772)


<a id="orge0c0ebf"></a>

# This is a very  simple pod


<a id="orgbe1897a"></a>

## Check your current namespace

Before creating objects in OpenShift or Kubernetes you should check
the current namespace that you are using

    oc project


<a id="org830274e"></a>

## Creating a simple pod from the command line

    oc run -i -t ubi --image=registry.redhat.io/ubi8/ubi:8.3 --restart=Never --rm

-   -i &#x2026; run interactivly
-   -t &#x2026; allocate a terminal
-   &#x2013;restart=Never &#x2026; Do not restart this pod
-   &#x2013;rm &#x2026; Delete resources after this pod exits

Try this command again but this time remove the <span class="underline">&#x2013;rm</span> option

    oc run -i -t ubi --image=registry.redhat.io/ubi8/ubi:8.3 --restart=Never

Check if there is still a pod resource after you exit the shell

    oc get pods

When finished delete the pod with

    oc delete pod ubi


<a id="org17e911d"></a>

## Creating a simple pod via a yaml file

create the simple pod with

    oc create -f simple-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="orgf97c2bf"></a>

## A pod running two containers

Take a look at advanced-pod.yml. Explain what you see.

    oc create -f advanced-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="org998b772"></a>

# Cleanup

Execute

    ../../utils/cleanup.sh
