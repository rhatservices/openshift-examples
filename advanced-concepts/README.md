
# Table of Contents

1.  [bash completion](#orge936acc)
2.  [Prerequisites for the advanced examples](#org31e2680)
    1.  [Installation of the OpenShift GitOps operator and the ArgoCD binary](#org84fc078)
    2.  [Installation of Bitnami Sealed Secrets and kubeseal](#orgfa5dcca)
    3.  [Installation of kustomize](#orga64af18)


<a id="orge936acc"></a>

# bash completion

&#x2026;


<a id="org31e2680"></a>

# Prerequisites for the advanced examples


<a id="org84fc078"></a>

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


<a id="orgfa5dcca"></a>

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


<a id="orga64af18"></a>

## Installation of kustomize

    curl -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.9.4/kustomize_v3.9.4_linux_amd64.tar.gz
