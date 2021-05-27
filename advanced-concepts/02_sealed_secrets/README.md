
# Table of Contents

1.  [Creating a sealed secret](#org060b7cf)
    1.  [Understanding scopes](#orge7a4b5b)
2.  [Cleanup](#org6468595)


<a id="org060b7cf"></a>

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


<a id="orge7a4b5b"></a>

## Understanding scopes

What is the default scope of a seal secret?

Change the name of the sealed secret in [sealed<sub>secret.json</sub>](sealed_secret.json) `.metadata.name` and `spec.template.metadata.name`.

Create the sealed secret with the changed name

    oc create -f sealed_secret.json

What happens to the secret?

What is the state of the sealed secrets?


<a id="org6468595"></a>

# Cleanup

Execute:

    ../../utils/cleanup.sh
