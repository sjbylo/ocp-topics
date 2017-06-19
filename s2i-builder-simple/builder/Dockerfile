# This image creates a very simple s2i builder image
FROM openshift/base-centos7

LABEL io.k8s.description="simple s2i builder example" \
      io.k8s.display-name="simple s2i builder example" \
      io.openshift.tags="builder"
#      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \

# Copy the example S2I scripts to the expected location
COPY ./s2i/ /usr/libexec/s2i

USER 1001

# Set the default CMD to print the usage of the language image
CMD /usr/libexec/s2i/usage
