
# Table of Contents

1.  [ArgoCD](#orge33dc0c)
    1.  [Create an ArgoCD instance in your project and try to login](#orgfb070ae)
    2.  [Deploying a simple application](#org9a46ec0)


<a id="orge33dc0c"></a>

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

ArgoCD needs project admin rights in your namespace:

    oc adm policy add-cluster-role-to-user cluster-admin -z argocd-argocd-application-controller


<a id="orgfb070ae"></a>

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


<a id="org9a46ec0"></a>

## Deploying a simple application

Create an example application within ArgoCD

    PROJECT=$(oc project -q)
    argocd app create nginx-app --project default --repo https://github.com/rhatservices/openshift-examples.git --revision main --path advanced-concepts/04_argocd/application --dest-server https://kubernetes.default.svc --dest-namespace $PROJECT

What is the state of the ArgoCD application after creating the new app?

    argocd app list
    argocd app get nginx-app

Can you synchronize the app?
