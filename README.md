
# Table of Contents

1.  [This repository includes various OpenShift / Kubernetes examples](#orgdeb03ea)
    1.  [Core concepts](#org8e478ce)
    2.  [Advanced topics](#orge279625)


<a id="orgdeb03ea"></a>

# This repository includes various OpenShift / Kubernetes examples

It is mainly used in workshops regarding OpenShift and Kubernetes
basics. Feel free to use the examples in this repository.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: MIGHT EAT YOUR BELOVED CAT</td>
</tr>
</tbody>
</table>

Examples are implemented using

-   registry.redhat.io/ubi8/ubi:8.3
-   <https://github.com/rhatservices/openshift-quarkus-example>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: Some examples requires project admin privileges</td>
</tr>
</tbody>
</table>


<a id="org8e478ce"></a>

## [Core concepts](core-concepts/)

Includes basic examples like:

-   [Creating simple pods](core-concepts/01_simple-pod/)
-   [Projects and namespaces](core-concepts/02_projects_namespaces/)
-   [Configmaps and secrets](core-concepts/03_configmaps-secrets/)
-   [Working with deployments](core-concepts/04_deployments/)
-   [Services and routes](core-concepts/05_services_routes/)
-   [Working with labels](core-concepts/06_labels/)
-   [Liveness and readyness probes](core-concepts/07_probes/)
-   [Limits and quotas](core-concepts/08_limits_quotas/)
-   [Pod placement](core-concepts/09_pod-placement)
-   [Pod disruption budgets](core-concepts/10_pod_disruption_budget/)
-   [Pod Topology Spread Constraints](core-concepts/11_pod_topology_spread_constraints/)


<a id="orge279625"></a>

## [Advanced topics](advanced-concepts/)

-   [Building images](advanced-concepts/01_building)
-   [Sealed secrets](advanced-concepts/02_sealed_secrets/)
-   [Kustomize](advanced-concepts/03_kustomize/)
-   [ArgoCD](advanced-concepts/04_argocd)
