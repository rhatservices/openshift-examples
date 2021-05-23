
# Table of Contents

1.  [This is a very  simple pod](#org567701c)
    1.  [Check your current namespace](#orgc1fcddd)
    2.  [Creating a simple pod from the command line](#orge81e916)
    3.  [Creating a simple pod via a yaml file](#org74d62a1)
    4.  [A pod running two containers](#org1145a89)
2.  [Cleanup](#orgcf1e9a5)


<a id="org567701c"></a>

# This is a very  simple pod


<a id="orgc1fcddd"></a>

## Check your current namespace

Before creating objects in OpenShift or Kubernetes you should check
the current namespace that you are using

    oc project


<a id="orge81e916"></a>

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


<a id="org74d62a1"></a>

## Creating a simple pod via a yaml file

create the simple pod with

    oc create -f simple-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="org1145a89"></a>

## A pod running two containers

Take a look at advanced-pod.yml. Explain what you see.

    oc create -f advanced-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="orgcf1e9a5"></a>

# Cleanup

Execute

    ../../utils/cleanup.sh
