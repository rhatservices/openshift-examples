
# Table of Contents

1.  [Configuring applications with configmaps and secrets](#org4ec0266)
2.  [Cleanup](#orgcdb55c8)


<a id="org4ec0266"></a>

# Configuring applications with configmaps and secrets

Create the following configmap's

    oc create cm run --from-file=run.sh
    oc create cm config --from-file=configuration=mainconfig.yml --from-file=anotherconfig.yml
    oc create cm podenv --from-literal=variable=myvalue

Create the following secret

    oc create secret generic geheim --from-literal=secret=nobody_knows

Start a pod with

    oc apply -f not-so-simple-pod.yml

Take a look at pod.yml and try to understand how it works


<a id="orgcdb55c8"></a>

# Cleanup

Execute

    ../../utils/cleanup.sh
