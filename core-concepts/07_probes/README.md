
# Table of Contents

1.  [Liveness and readyness probes](#org479c4bc)
    1.  [liveness probe in action](#org921cf97)
    2.  [liveness and readyness tcp probe](#org8751c0e)
    3.  [http probes](#org3547855)


<a id="org479c4bc"></a>

# Liveness and readyness probes


<a id="org921cf97"></a>

## liveness probe in action

Take a look at the pod definition of [liveness-pod.yml](liveness-pod.yml)

What do you expect if you delete <span class="underline">/tmp/healthy</span>?

Create the pod with

    oc create -f liveness-pod.yml

Look at the pod status especially the liveness check via

    oc describe pod liveness-exec

What will happen if you delete /tmp/healthy?

    oc exec liveness-exec -- rm /tmp/healthy

Look at the pod status

    oc descibe pod liveness-exec


<a id="org8751c0e"></a>

## liveness and readyness tcp probe

Create a pod that implementes a TCP liveness and readiness probe

    oc create -f live-ready-probe-pod.yml

Describe the pod status

    oc describe pod tcp-live-ready

Does the status change over time?


<a id="org3547855"></a>

## http probes

Create a pod implementing HTTP based probes

    oc create -f http-probe-pod.yml

What is the status of the pods

    oc describe pod liveness-http

Can you fix the pod?
