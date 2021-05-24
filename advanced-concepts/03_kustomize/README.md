
# Table of Contents

1.  [Kustomize basics](#orgfe73407)
    1.  [Overlays](#org49bdf4c)
2.  [Cleanup](#org9fb656c)


<a id="orgfe73407"></a>

# Kustomize basics

Run `kustomize build` and take a look at the resources that `kustomize` is going to build

    kustomize build base/

Apply the base application

    kustomize build base/ | oc apply -f -

You could also run

    oc apply -k build/

as `oc` and `kubectl` already bundle a version of kustomize

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">:exclamation: The version bundled with oc or kubectl of kustomize is rather old. If there are any problems use kustomize directly</td>
</tr>
</tbody>
</table>

Use `curl` to test the deployed nginx instance

    ROUTE=$(oc get route nginx -o jsonpath={.spec.host})
    curl -v "$ROUTE"


<a id="org49bdf4c"></a>

## Overlays

Now lets try to use the overlay

    kustomize build overlays/training/

Try do create the resources with kustomize:

    kustomize build overlays/training/ | oc apply -f -

What is the status of the nginx pods?

What happens if you use curl to test the application again?


<a id="org9fb656c"></a>

# Cleanup

Execute:

    ../../utils/cleanup.sh
