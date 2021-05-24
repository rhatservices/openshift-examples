
# Table of Contents

1.  [Kustomize basics](#org4796a96)
    1.  [Overlays](#org7c12efa)
2.  [Cleanup](#orgb676127)


<a id="org4796a96"></a>

# Kustomize basics

Run `kustomize build` and take a look at the resources that `kustomize` is going to build

    kustomize build base/

Apply the base application

    kustomize build base/ | oc apply -f -

You could also run

    oc apply -k build/

as oc or kubectl already bundle a version of kustomize

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

Use curl to test the deployed nginx instance

    ROUTE=$(oc get route nginx -o jsonpath={.spec.host})
    curl -v "$ROUTE"


<a id="org7c12efa"></a>

## Overlays

Apply the overlay hello-conschul

    oc apply -k overlays/hello-consul/

Does this work?

Try do create the resources with kustomize:

    kustomize build overlays/hello-conschul/

What is the status of the nginx pods?

What happens if you use curl to test the application again?


<a id="orgb676127"></a>

# Cleanup
