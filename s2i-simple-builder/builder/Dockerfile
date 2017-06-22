# This image creates a very simple s2i builder image
# We are basing our builder image on openshift base-centos7 image

FROM openshift/base-centos7

# Set labels used in OpenShift to describe the builder images

LABEL io.k8s.description="Simple s2i builder example, used to build the simple 'cat-runtime'." \
      io.k8s.display-name="Simple s2i builder example" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
      io.openshift.tags="builder"

# Copy the example S2I scripts to the expected location
COPY ./s2i/ /usr/libexec/s2i

# Set the default user for the image
USER 1001

# Set the default CMD to print the usage of the image, if somebody does docker run
CMD /usr/libexec/s2i/usage
