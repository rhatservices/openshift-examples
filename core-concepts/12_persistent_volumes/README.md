
# Table of Contents

1.  [Working with persistent volumes](#org750921f)
    1.  [creating a PersistentVolumeClaim (PVC)](#org9e8f363)
    2.  [Using the storage class](#org11f7209)
    3.  [Confirming volume mounts](#org7d16a7a)
2.  [Cleanup](#orgba0d1e4)


<a id="org750921f"></a>

# Working with persistent volumes

Execute

    oc get storageclasses

to get a list of available storage classes


<a id="org9e8f363"></a>

## creating a PersistentVolumeClaim (PVC)

Take a look at <span class="underline">pvc.yaml</span>. You have to add the StorageClass you
would like to use (`mystorageclass` in the example below):

    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: test-pvc
    spec:
      storageClassName: "mystorageclass" # add available storage class here
      accessModes:
        - ReadWriteOnce    # could also be ReadWriteMany, talk to you admin if in doubt.
      resources:
        requests:
          storage: 1Gi
      volumeMode: Filesystem

Select a StorageClass from the list of available classes.

It is also possible that a default StorageClass is defined. If this
is the case you can remove the `storageClassName` parameter and
OpenShift will automatically use the default StorageClass. Please
talk to your beloved OpenShift admin.

Create the PVC after adding the `storageClassName` with

    oc create -f pvc.yaml


<a id="org11f7209"></a>

## Using the storage class

<span class="underline">deployment.yml</span> contains an example deployment that uses the PVC
create in the previous example:

    oc create -f deployment.yml


<a id="org7d16a7a"></a>

## Confirming volume mounts

Store the pod name in an environment variable via

    export POD=$(oc get pods -l app=pvc-test -o jsonpath={.items[0].metadata.name})

Open a remote shell to the pod:

    oc rsh $POD

Confirm that the volume is mounted

    sh-4.4$ df -h /mnt
    Filesystem                                     Size  Used Avail Use% Mounted on
    /dev/mapper/360002ac0000000000000007900023ff4 1020M   40M  980M   4% /mnt
    sh-4.4$


<a id="orgba0d1e4"></a>

# Cleanup

Execute

    ../../utils/cleanup.sh
