
# Table of Contents

1.  [Pod Topology Spread Constraints](#orgcbce10b)
    1.  [Prerequisites](#org8c34061)
    2.  [Using <span class="underline">whenUnsatisfiable</span> <span class="underline">ScheduleAnyway</span>](#org9da4a03)
    3.  [Using <span class="underline">whenUnsatisfiable</span> <span class="underline">DoNotSchedule</span>](#orgc60cf81)


<a id="orgcbce10b"></a>

# Pod Topology Spread Constraints


<a id="org8c34061"></a>

## Prerequisites

You need to label 2 nodes of you cluster with a label called
<span class="underline">testdomain</span>.  This is going to be our example topology key.

For example:

    oc label node worker01 testdomain=A
    oc label node worker02 testdomain=B


<a id="org9da4a03"></a>

## Using <span class="underline">whenUnsatisfiable</span> <span class="underline">ScheduleAnyway</span>

Create a deployment with <span class="underline">whenUnsatisfiable</span> is set to <span class="underline">ScheduleAnyway</span>

    oc create -f deployment_schedule.yml

What is the state of the pods after the deployments succeeds?

    oc get pods

Shut down one of the nodes and check the status of the pods again.
What happend to the pods?

Remove the deployment

    oc delete deployment deployment-schedule


<a id="orgc60cf81"></a>

## Using <span class="underline">whenUnsatisfiable</span> <span class="underline">DoNotSchedule</span>

Create a deployment with <span class="underline">whenUnsatisfiable</span> is set to <span class="underline">ScheduleAnyway</span>

    oc create -f deployment_noschedule.yml

What is the state of the pods after the deployments succeeds?

    oc get pods

Shut down one of the nodes and check the status of the pods again.
What happend to the pods?

Remove the deployment

    oc delete deployment deployment-schedule
