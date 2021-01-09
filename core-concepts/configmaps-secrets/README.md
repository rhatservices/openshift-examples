
# Table of Contents

1.  [Configuring applications with configmaps and secrets](#org76dc168)


<a id="org76dc168"></a>

# Configuring applications with configmaps and secrets

Create the following configmap

    oc create cm user --from-literal=user=John

Create the following secret

    oc create secret generic geheim --from-literal=secret=nobody_knows

Start a pod with

    oc apply -f pod.yml
