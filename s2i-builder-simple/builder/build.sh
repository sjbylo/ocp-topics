oc import-image openshift/base-centos7 --confirm

oc new-build . --name s2i-simple-builder

oc start-build s2i-simple-builder --from-dir=.

oc logs bc/s2i-simple-builder -f

