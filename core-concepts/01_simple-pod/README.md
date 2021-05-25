
# Table of Contents

1.  [This is a very  simple pod](#org9d3b59d)
    1.  [Check your current namespace](#org64387be)
    2.  [Creating a simple pod from the command line](#orgeadc205)
    3.  [Creating a simple pod via a yaml file](#org2a5005e)
    4.  [A pod running two containers](#org8aa5731)
2.  [Cleanup](#orgb0ed595)


<a id="org9d3b59d"></a>

# This is a very  simple pod


<a id="org64387be"></a>

## Check your current namespace

Before creating objects in OpenShift or Kubernetes you should check
the current namespace that you are using

    oc project


<a id="orgeadc205"></a>

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


<a id="org2a5005e"></a>

## Creating a simple pod via a yaml file

create the simple pod with

    oc create -f simple-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.


<a id="org8aa5731"></a>

## A pod running two containers

Take a look at advanced-pod.yml. Explain what you see.

    oc create -f advanced-pod.yml

run

    oc get pods

to the list of running pods in the current namespace.

For listing the pod logs you need to specify the container name if
more than one container is running within the pod.

    oc logs -c container1 advanced-pod
    oc logs -c container2 advanced-pod


<a id="orgb0ed595"></a>

# Cleanup

Execute

    ../../utils/cleanup.sh
