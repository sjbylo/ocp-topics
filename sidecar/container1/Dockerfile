# This image will simply write to localhost:2000 
FROM openshift/base-centos7
RUN yum -y install telnet && yum -y clean all
USER 1001
CMD while true; do (date; sleep 1) | telnet -4 localhost 2000; sleep 3; done

