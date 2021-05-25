
# Table of Contents

1.  [ArgoCD](#org2a1e70a)
    1.  [ArgoCD workaround](#org0a73bc3)
    2.  [Create an ArgoCD instance in your project and try to login](#org724b5e8)
    3.  [Deploying a simple application](#orgd722a99)


<a id="org2a1e70a"></a>

# ArgoCD

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: For me ArgoCD currently only works with cluster-admin privileges</td>
</tr>
</tbody>
</table>


<a id="org0a73bc3"></a>

## ArgoCD workaround

There is an open issue when ArgoCD is in a single namespace:

<https://issues.redhat.com/browse/GITOPS-993>

For a workaround deploy the following role:

    apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      name: argocd-workaround993-role
    rules:
    - apiGroups: ["*"]
      resources: ["*"]
      verbs: ["*"]

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: Make sure you are in the correct namespace before applying the role</td>
</tr>
</tbody>
</table>

and the following rolebinding:

    apiVersion: rbac.authorization.k8s.io/v1
    kind: RoleBinding
    metadata:
      name: argocd-workaround993-rolebinding
    subjects:
    - kind: ServiceAccount
      name: argocd-argocd-application-controller
    roleRef:
      kind: Role
      name: argocd-workaround993-role
      apiGroup: rbac.authorization.k8s.io

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: Make sure you are in the correct namespace before applying the rolebinding</td>
</tr>
</tbody>
</table>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: Make sure you are using the right service account name in the rolebinding</td>
</tr>
</tbody>
</table>

Then

-   Login to ArgoCD with the admin user (see below)
-   Go to settings / clusters
-   Server should be <https://kubernetes.default.svc>
-   Make sure the namespace is set to the namespace ArgoCD is running in

This should be fixed with versino 1.1.2 of the GitOps operator


<a id="org724b5e8"></a>

## Create an ArgoCD instance in your project and try to login

First we create a new ArgoCD instance in our namespace.

Make sure you are in the correct namespace before executing this command!

    oc apply -f argocd.yml

Extract the admin password and the route and login to ArgoCD

    export ARGOCD_PASSWORD=$(oc get secrets -o jsonpath="{.data['admin\.password']}" argocd-cluster |base64 -d)
    export ARGOCD_ROUTE=$(oc get route -o yaml argocd-server -o jsonpath={.spec.host})

Execute

    oc get argocd argocd -o jsonpath='{.status.phase}{"\n"}'

and wait for ArgoCD to become available.

    argocd  login --insecure --username admin --password "$ARGOCD_PASSWORD"  "$ARGOCD_ROUTE"

Try to list the available projects:

    argocd proj list

ArgoCD also support SSO authentication via Keycloak, see
<https://docs.openshift.com/container-platform/4.7/cicd/gitops/configuring-sso-for-argo-cd-on-openshift.html>
for more information.

Another method of authentication is using ArgoCD [DEX](https://www.openshift.com/blog/openshift-authentication-integration-with-argocd). Be aware that
this is **not** supported by Red Hat.


<a id="orgd722a99"></a>

## Deploying a simple application

Create an example application within ArgoCD

    PROJECT=$(oc project -q)
    argocd app create nginx-app --project default --repo https://github.com/rhatservices/openshift-examples.git --revision main --path advanced-concepts/04_argocd/application --dest-server https://kubernetes.default.svc --dest-namespace $PROJECT

What is the state of the ArgoCD application after creating the new app?

    argocd app list
    argocd app get nginx-app

Can you synchronize the app?
