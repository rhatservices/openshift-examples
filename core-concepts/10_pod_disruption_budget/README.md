
# Table of Contents

1.  [Pod disruption budget](#org403d345)
    1.  [Cleanup](#org040bd0c)


<a id="org403d345"></a>

# Pod disruption budget

Create the sample pod disruption budget

    oc create -f pdb.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb

Create an example pod with a label of environment=production

    oc create -f pod.yml

Check the status of the pod disruption budget

    oc describe pdb example-pdb

Create a second example pod with a label of environment=production

     oc create -f pod2.yml

Check the status of the pod disruption budget

     oc describe pdb example-pdb

Fetch your current token

    oc whoami -t

Fetch your API server address

    oc whoami --show-server

Evict POD #1 using curl command and your token:
Assuming that namespace is called "new"

    curl -k -v -H 'Content-type: application/json' -H 'Authorization: Bearer <TOKEN>' https://<API-URL>/api/v1/namespaces/new/pods/pod/eviction -d @eviction_pod.json

Verify that this results in:

```json
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {

  },
  "status": "Success",
  "code": 201
}
```

Try to delete the 2nd Pod

    curl -k -v -H 'Content-type: application/json' -H 'Authorization: Bearer <TOKEN>' https://<API-URL>/api/v1/namespaces/new/pods/pod2/eviction -d @eviction_pod2.json

PDB will prohibit this: 

```json
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {

  },
  "status": "Failure",
  "message": "Cannot evict pod as it would violate the pod's disruption budget.",
  "reason": "TooManyRequests",
  "details": {
    "causes": [
      {
        "reason": "DisruptionBudget",
        "message": "The disruption budget example-pdb needs 1 healthy pods and has 1 currently"
      }
    ]
  },
  "code": 429
}
```

<a id="org040bd0c"></a>

## Cleanup

Execute

    ../../utils/cleanup.sh
