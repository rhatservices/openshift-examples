
# Table of Contents

1.  [Liveness and readyness probes](#org08efa13)
    1.  [liveness probe in action](#org18b9f8c)
    2.  [liveness and readyness tcp probe](#org5b57c27)
    3.  [http probes](#orgba5237e)
    4.  [Cleanup](#orgc6841db)


<a id="org08efa13"></a>

# Liveness and readyness probes


<a id="org18b9f8c"></a>

## liveness probe in action

Take a look at the pod definition of [liveness-pod.yml](liveness-pod.yml)

What do you expect if you delete <span class="underline">/tmp/healthy</span>?

Create the pod with

    oc create -f liveness-exec-pod.yml

Look at the pod status especially the liveness check via

    oc describe pod liveness-exec

What do you expect will happen after 30 seconds?

    oc describe pod liveness-exec

Look at the pod status

    oc descibe pod liveness-exec


<a id="org5b57c27"></a>

## liveness and readyness tcp probe

Create a pod that implementes a TCP liveness and readiness probe

    oc create -f tcp-probe-pod.yml

Describe the pod status

    oc describe pod tcp-probe

Does the status change over time?


<a id="orgba5237e"></a>

## http probes

Create a pod implementing HTTP based probes

    oc create -f http-probe-pod.yml

What is the status of the pods

    oc describe pod http-probe

Can you fix the pod?


<a id="orgc6841db"></a>

## Cleanup

    oc delete pod liveness-exec tcp-probe http-probe
