# This image can be used to test outgoing ports with telnet.
FROM openshift/base-centos7

RUN yum -y install telnet && yum -y clean all

USER 1001

CMD while true; do sleep 1; done


