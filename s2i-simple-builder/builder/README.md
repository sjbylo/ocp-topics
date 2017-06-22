# This is a simple example of how to create an s2i builder image

The Source to Image tool, which is integrated into OpenShift, is interesting for OpenShift users as it can shield users from the intricacies of creating Docker container images.  More can be read about Source to Image at the [project's page](https://github.com/openshift/source-to-image/blob/master/README.md).

There are several reasons to use Source to Image but the two which are mentioned often are:

1. A developer can get up and running with Docker without knowing anything about Docker itself.  This is great for Developers who are not interested in Docker and just want to get their code running on OpenShift. 
1. An Enterprise wants to have more control over how their teams build container images and don't want to allow developers the freedom to install anything they choose into container images.  The Source to Image process shields the user somewhat from the details of how Docker works and does not allow anything to be installed using root privileges. 

The Dockerfile in this directory creates an s2i builder image.  The simple application runtime is represented by the "cat" command and will simply display the contents of any "source code" files provided by the developer during the s2i build process. 

Try the following:

Look at the Dockerfile to understand how it creates a special docker image, an s2i builder image, by adding s2i scripts and labelling the image. 

Build the s2i builder image. If you have docker available, you can build it like this:

```
docker build -t s2i-simple-builder . 

docker run s2i-simple-builder
```

Notice that when you "docker run" an s2i builder image as-is, without providing any "source code", you will usually see a message describing how to use the image. 

To build the image inside openshift and have it pushed into the internal registry, run these commands:

```
oc import-image openshift/base-centos7 --confirm      # Make the base image available. Do this only once.

oc new-build --name s2i-simple-builder --binary=true  # Create the build configuration (using Docker build strategry) 

oc start-build s2i-simple-builder --from-dir=.        # Start the build, using the current diectory

oc logs bc/s2i-simple-builder -f                      # Check the build output for errors 
```

If all went well, the new s2i buider image (s2i-simple-builder) has been created and pushed successfully into the registry.

Show the newly created image stream which references and tracks the s2i simple builder image in the registry.

```
oc get is
oc describe is <is>
```

The builder image can be used to create a runtime image.  Go to the associated [myapp](../myapp) directory and continue there.

