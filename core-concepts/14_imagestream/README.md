skopeo inspect docker://registry.access.redhat.com/ubi8/ubi

podman login -u="robot name" -p="token" quay.io

- add ubi repo + allow write for robot account

skopeo copy docker://registry.access.redhat.com/ubi8/ubi:8.6-754 docker://quay.io/tosmi/ubi:8

oc apply -f deployment.yaml

oc get pod imagestream-669c7457f8-kxp5n -o jsonpath='{.spec.containers[0].image}{"\n"}'

delete pods / deploy still using quay tag

oc import-image ubi --confirm --all --from quay.io/tosmi/ubi

oc get istag


oc set triggers deployment/imagestream --from-image ubi:8 -c imagestream

this triggers  a redeployment

oc get pod imagestream-... -o jsonpath='{.spec.containers[0].image}{"\n"}'

show sha256 is used for image

oc logs imagestream-6b4ddd9bfd-khd94
Dockerfile-ubi8-8.6-754
content_manifests

copy new image skopeo copy docker://registry.access.redhat.com/ubi8/ubi:8.6-990 docker://quay.io/tosmi/ubi:8

re-import image tags

oc import-image ubi --confirm --all

rollout of  a new pod starts

NAME                           READY   STATUS              RESTARTS   AGE
imagestream-646d5bff8c-7zmjc   0/1     ContainerCreating   0          10s
imagestream-6b4ddd9bfd-khd94   1/1     Running             0          5m46s


oc logs imagestream-646d5bff8c-7zmjc
Dockerfile-ubi8-8.6-990
content_manifests
