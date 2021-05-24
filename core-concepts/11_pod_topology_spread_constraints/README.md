
# Table of Contents

1.  [Pod Topology Spread Constraints](#org6e6e93b)
    1.  [Prerequisites](#org4062413)
    2.  [Using <span class="underline">whenUnsatisfiable</span> <span class="underline">ScheduleAnyway</span>](#orgc7e7b7e)
    3.  [Using <span class="underline">whenUnsatisfiable</span> <span class="underline">DoNotSchedule</span>](#org4cce5b3)


<a id="org6e6e93b"></a>

# Pod Topology Spread Constraints


<a id="org4062413"></a>

## Prerequisites

You need to label 2 nodes of you cluster with a label called
<span class="underline">testdomain</span>.  This is going to be our example topology key.

For example:

    oc label node worker01 testdomain=A
    oc label node worker02 testdomain=B

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: Labeling nodes requires cluster-admin privileges</td>
</tr>
</tbody>
</table>


<a id="orgc7e7b7e"></a>

## Using <span class="underline">whenUnsatisfiable</span> <span class="underline">ScheduleAnyway</span>

Create a deployment with <span class="underline">whenUnsatisfiable</span> is set to <span class="underline">ScheduleAnyway</span>

    oc create -f deployment_schedule.yml

What is the state of the pods after the deployments succeeds?

    oc get pods

Shut down one of the nodes and check the status of the pods again.
What happend to the pods?

Remove the deployment

    oc delete deployment deployment-schedule


<a id="org4cce5b3"></a>

## Using <span class="underline">whenUnsatisfiable</span> <span class="underline">DoNotSchedule</span>

Create a deployment with <span class="underline">whenUnsatisfiable</span> is set to <span class="underline">ScheduleAnyway</span>

    oc create -f deployment_noschedule.yml

What is the state of the pods after the deployments succeeds?

    oc get pods

Shut down one of the nodes and check the status of the pods again.
What happend to the pods?

Remove the deployment

    oc delete deployment deployment-schedule
