
# Table of Contents

1.  [Creating a sealed secret](#org94e7831)
    1.  [Understanding scopes](#org3514a05)
2.  [Cleanup](#orgffda15a)


<a id="org94e7831"></a>

# Creating a sealed secret

Take a look at the [plain<sub>secret.yml</sub>](plain_secret.yml) file. Can you decode the secret?

Create a sealed secret with [plain<sub>secret.yml</sub>](plain_secret.yml) as input

    kubeseal <plain_secret.yml > sealed_secret.json

Create and label the sealed secret object:

    oc create -f sealed_secret.json
    oc label sealedsecrets.bitnami.com important openshift-example=yes

List the current secrets and sealedsecrets:

    oc get sealedsecrets
    oc desribe sealedsecrets
    oc get secrets

Why do we have a standard K8s secret with the same name?

Run cleanup.sh for the next example:

    ../../utils/cleanup.sh


<a id="org3514a05"></a>

## Understanding scopes

What is the default scope of a seal secret?

Change the name of the sealed secret in [sealed<sub>secret.json</sub>](sealed_secret.json) `.metadata.name` and `spec.template.metadata.name`.

Create the sealed secret with the changed name

    oc create -f sealed_secret.json

What happens to the secret?

What is the state of the sealed secrets?


<a id="orgffda15a"></a>

# Cleanup

Execute:

    ../../utils/cleanup.sh
