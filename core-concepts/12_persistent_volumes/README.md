
# Table of Contents

1.  [Working with persistent volumes](#org265bf53)
    1.  [creating a PersistentVolumeClaim (PVC)](#org800e681)
    2.  [Using the storage class](#org2edbda7)


<a id="org265bf53"></a>

# Working with persistent volumes

Execute

    oc get storageclasses

to get a list of available storage classes


<a id="org800e681"></a>

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


<a id="org2edbda7"></a>

## Using the storage class

<span class="underline">deployment.yml</span> contains an example deployment that uses the PVC
create in the previous example:

    oc create -f deployment.yml
