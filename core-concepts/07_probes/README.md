
# Table of Contents

1.  [Liveness and readyness probes](#orgf7f77f6)
    1.  [liveness probe in action](#org6f74694)
    2.  [liveness and readyness tcp probe](#orgf1dc032)
    3.  [http probes](#orgf16e157)
    4.  [Cleanup](#org0640922)


<a id="orgf7f77f6"></a>

# Liveness and readyness probes


<a id="org6f74694"></a>

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

    oc describe pod liveness-exec


<a id="orgf1dc032"></a>

## liveness and readyness tcp probe

Create a pod that implementes a TCP liveness and readiness probe

    oc create -f tcp-probe-pod.yml

Describe the pod status

    oc describe pod tcp-probe

Does the status change over time?


<a id="orgf16e157"></a>

## http probes

Create a pod implementing HTTP based probes

    oc create -f http-probe-pod.yml

What is the status of the pods

    oc describe pod http-probe

Can you fix the pod?


<a id="org0640922"></a>

## Cleanup

    oc delete pod liveness-exec tcp-probe http-probe
