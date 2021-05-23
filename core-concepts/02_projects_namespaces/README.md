
# Table of Contents

1.  [Projects and namespaces](#orgffb4555)


<a id="orgffb4555"></a>

# Projects and namespaces

Take a look at you current namespaces/project

    oc status

Which project are you currently using?

Store the current project name in an environment variable:

    export PROJECT=$(oc project -q)

Are there any annotations on your project?

    oc describe project $PROJECT

What is the difference to a namespace?

    oc describe ns $PROJECT
