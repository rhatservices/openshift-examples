
# Table of Contents

1.  [ArgoCD](#orgfb72bb4)
    1.  [Create an ArgoCD instance in your project and try to login](#org570c5b7)
    2.  [Deploying a simple application](#org47aec8d)


<a id="orgfb72bb4"></a>

# ArgoCD


<a id="org570c5b7"></a>

## Create an ArgoCD instance in your project and try to login

First we create a new ArgoCD instance in our namespace.

Make sure you are in the correct namespace before executing this command!

    oc apply -f argocd.yml

Extract the admin password and the route and login to ArgoCD

    export ARGOCD_PASSWORD=$(oc get secrets -o jsonpath="{.data['admin\.password']}" argocd-cluster |base64 -d)
    export ARGOCD_ROUTE=$(oc get route -o yaml argocd-server -o jsonpath={.spec.host})

    argocd  login --insecure --username admin --password "$ARGOCD_PASSWORD"  "$ARGOCD_ROUTE"

Try to list the available projects:

    argocd proj list

ArgoCD also support SSO authentication via Keycloak, see
<https://docs.openshift.com/container-platform/4.7/cicd/gitops/configuring-sso-for-argo-cd-on-openshift.html>
for more information.

Another method of authentication is using ArgoCD [DEX](https://www.openshift.com/blog/openshift-authentication-integration-with-argocd). Be aware that
this is **not** supported by Red Hat.


<a id="org47aec8d"></a>

## Deploying a simple application

Create an example application within ArgoCD

    argocd app create example-app --project <project name> --repo <gitlab url>/openshift-examples.git --revision main --path advanced-concepts/01_argocd/application --dest-server https://kubernetes.default.svc --dest-namespace <namespace>

What is the state of the ArgoCD application after creating the new app?

Can you synchronize the app?
