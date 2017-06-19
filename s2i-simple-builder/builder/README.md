# This is a simple example of how to create an s2i builder image

The Dockerfile creates an s2i builder image.  The application runtime is represented by the "cat" command and will simply display the contents of any "source code" files provided during the s2i build.

Try the following:

Look at the Dockerfile to understand how it creates a special docker image, an s2i builder image, by adding s2i scripts and labelling the image. 

Build the s2i builder image. If you have docker available, you can build it like this:

```
docker build -t s2i-simple-builder . 

docker run s2i-simple-builder
```

Notice that when you "docker run" an s2i builder image as-is, without providing any "source code", you will usually see a message describing how to use the image. 

To build the image inside openshift and have it pushed into the internal registry, follow these commands:

```
oc import-image openshift/base-centos7 --confirm     # Make the base image available. Do this only once.

oc new-build --name s2i-simple-builder --binary=true # Create the build configuration (using Docker build strategry) 

oc start-build s2i-simple-builder --from-dir=.       # Start the build, using the current diectory

oc logs bc/s2i-simple-builder -f                     # Check the build output for errors 

```

If all went well, the new s2i buider image (s2i-simple-builder) has been created and pushed successfully into the registry.

The builder image can be used to create a runtime image.  Go to the myapp directory and continue there.




