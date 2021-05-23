
# Table of Contents

1.  [Building applications with OpenShift](#org5b6133e)


<a id="org5b6133e"></a>

# Building applications with OpenShift

We created a <span class="underline">very</span> simple Quarkus (java) application that we would
like to build with the help of OpenShift. The application provides a rest endpoint
for listing pod objects.

Execute the following command:

    oc new-app quay.io/quarkus/ubi-quarkus-native-s2i:20.3-java11~https://github.com/rhatservices/openshift-quarkus-example.git

Closely watch the generated output:

    --> Found container image a9937ea (4 weeks old) from registry.access.redhat.com for "registry.access.redhat.com/ubi8/openjdk-11"

        Java Applications
        -----------------
        Platform for building and running plain Java applications (fat-jar and flat classpath)

        Tags: builder, java

        * An image stream tag will be created as "openjdk-11:latest" that will track the source image
        * A source build using source code from https://github.com/rhatservices/openshift-quarkus-example.git will be created
          * The resulting image will be pushed to image stream tag "openshift-quarkus-example:latest"
          * Every time "openjdk-11:latest" changes a new build will be triggered

    --> Creating resources ...
        imagestream.image.openshift.io "openjdk-11" created
        imagestream.image.openshift.io "openshift-quarkus-example" created
        buildconfig.build.openshift.io "openshift-quarkus-example" created
        deployment.apps "openshift-quarkus-example" created
        service "openshift-quarkus-example" created
    --> Success
        Build scheduled, use 'oc logs -f buildconfig/openshift-quarkus-example' to track its progress.
        Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
         'oc expose service/openshift-quarkus-example'
        Run 'oc status' to view your app.

You can see the current builds with

    oc get builds

Details are available with

    oc describe builds openshift-quarkus-example-1

To see the details of the running build execute the following commands:

    oc logs -f openshift-quarkus-example-1-build

After the build completes, check which pods are running

    oc get pods

If you want to start a new build an follow the logs:

    oc start-build openshift-quarkus-example --follow

Is there a already deployment for this application?

    oc get deployment

Lets try to expose our simple service

    oc expose svc openshift-quarkus-example
    ROUTE=$(oc get route -o yaml openshift-quarkus-example -o jsonpath={.spec.host})
    PROJECT=$(oc project -q)
    curl -v "$ROUTE"/pods/"$PROJECT"

What is the HTTP status code?

Is there a hint in the container log?

    oc logs -f -l deployment=openshift-quarkus-example

Let's try to fix this:

    oc adm policy add-role-to-user view -z default

Now let's try to query our HTTP endpoint again

    curl -v "$ROUTE"/pods/"$PROJECT"
