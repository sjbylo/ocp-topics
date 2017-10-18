# This image will simply listen on port 2000 and echo whatever you type in
FROM openshift/base-centos7

RUN yum -y install nc socat && yum -y clean all

USER 1001

EXPOSE 2000

#CMD ncat -l 2000 -k -c 'xargs -n1 echo'
CMD socat TCP4-LISTEN:2000,fork EXEC:cat


