
# Table of Contents

1.  [bash completion](#org7be23bc)
2.  [Prerequisites for the advanced examples](#orgd3e19e7)
    1.  [Installation of the OpenShift GitOps operator and the ArgoCD binary](#orgb92fbee)
    2.  [Installation of Bitnami Sealed Secrets and kubeseal](#org521db03)
    3.  [Installation of kustomize](#org63cee9a)


<a id="org7be23bc"></a>

# bash completion

&#x2026;

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: test</td>
</tr>
</tbody>
</table>


<a id="orgd3e19e7"></a>

# Prerequisites for the advanced examples


<a id="orgb92fbee"></a>

## Installation of the OpenShift GitOps operator and the ArgoCD binary

    apiVersion: operators.coreos.com/v1alpha1
    kind: Subscription
    metadata:
      name: redhat-openshift-gitops
      namespace: openshift-operators
    spec:
      channel: stable
      name: openshift-gitops-operator
      source: redhat-operators
      sourceNamespace: openshift-marketplace

    curl -O https://github.com/argoproj/argo-cd/releases/download/v2.0.2/argocd-linux-amd64
    sudo install -m 755 argocd-linux-amd64 /usr/local/bin/argocd


<a id="org521db03"></a>

## Installation of Bitnami Sealed Secrets and kubeseal

    oc apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/controller.yaml

    wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64 -O kubeseal
    sudo install -m 755 kubeseal /usr/local/bin/kubeseal

Create a required ClusterRole

    apiVersion: rbac.authorization.k8s.io/v1
    kind: ClusterRole
    metadata:
      labels:
        rbac.authorization.k8s.io/aggregate-to-admin: "true"
      name: sealedsecrets-edit
    rules:
    - apiGroups:
      - bitnami.com
      resources:
      - sealedsecrets
      verbs:
      - get
      - list
      - watch
      - create
      - patch
      - update
      - delete


<a id="org63cee9a"></a>

## Installation of kustomize

    curl -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.9.4/kustomize_v3.9.4_linux_amd64.tar.gz
