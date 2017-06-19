oc new-build --binary=true -i s2i-simple-builder --name myapp

oc start-build myapp --from-dir=. 

oc logs bc/myapp -f

oc new-app myapp

oc get pod

