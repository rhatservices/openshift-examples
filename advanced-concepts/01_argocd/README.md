
# Table of Contents

1.  [ArgoCD](#org43eff5b)


<a id="org43eff5b"></a>

# ArgoCD

Login to ArgoCD

    argocd login --sso <argo url>

Create an example application within ArgoCD

    argocd app create example-app --project <project name> --repo <gitlab url>/openshift-examples.git --revision main --path advanced-concepts/01_argocd/application --dest-server https://kubernetes.default.svc --dest-namespace <namespace>

What is the state of the ArgoCD application after creating the new app?

Can you synchronize the app?
