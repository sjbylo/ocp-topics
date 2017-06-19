oc import-image openshift/base-centos7 --confirm

oc new-build . --name s2i-builder-simple

oc start-build s2i-builder-simple --from-dir=.

oc logs bc/s2i-builder-simple -f

