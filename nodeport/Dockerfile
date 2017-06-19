FROM openshift/base-centos7

RUN yum -y install nc && yum -y clean all

# Set the default user for the image
USER 1001

# Set the default CMD to print the usage of the image, if somebody does docker run
CMD ncat -l 2000 -k -c 'xargs -n1 echo'

