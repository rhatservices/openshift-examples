
# Table of Contents

1.  [Creating a sealed secret](#org1219b08)
    1.  [Understanding scopes](#org4ef8dd9)


<a id="org1219b08"></a>

# Creating a sealed secret

Take a look at the [plain<sub>secret.yml</sub>](plain_secret.yml) file. Can you decode the secret?

Create a sealed secret with [plain<sub>secret.yml</sub>](plain_secret.yml) as input

    kubeseal <plain_secret.yml > sealed_secret.json

Create the sealed secret object:

    oc create -f sealed_secret.json

List the current secrets and sealedsecrets:

    oc get secrets
    oc get sealedsecrets

Why do we have a standard K8s secret with the same name?


<a id="org4ef8dd9"></a>

## Understanding scopes

What is the default scope of a seal secret?

Change the namespace name in [sealed<sub>secret.json</sub>](sealed_secret.json) (<sub>.metadata.name</sub>\_ and <span class="underline">.spec.template.metadata.name</span>).

Create the sealed secret with the changed namespace name

    oc create -f sealed_secret.json

What happens to the secret?

What is the state of the sealed secrets?
