# This is a simple example of how to create an s2i builder image

This Dockerfile creates an s2i builder image.  The application runtime is represented by the "cat" command and will simply display the contents of any "source code" files provided during the s2i build.

Try the following

View the Dockerfile and understand how it creates a special docker image, an s2i builder image.

Build the builder image. If you have docker available, you can build it like this:

```
docker build -t s2i-builder-simple . 

docker run s2i-builder-simple
```

Notice that if you "docker run" an s2i builder image as-is, without providing any "source code", you will usually see a message describing how to use the image. 

To build the image inside of openshift and have the image pushed into the internal registry, follow these commands.

```
oc import-image openshift/base-centos7 --confirm  # Make this base image available. Do this only once 

oc new-build . --name s2i-builder-simple          # Create the build configuration (using Docker build strategry) 

oc start-build s2i-builder-simple --from-dir=.    # Start the build, using the current diectory

oc logs bc/s2i-builder-simple -f                  # Check the build output for errors 

```

If all went well, the new s2i buider image (s2i-builder-simple) has been created and pushed successfully into the registry.

The builder image can be used to create a runtime image.  Go to the myapp directory and continue there.




