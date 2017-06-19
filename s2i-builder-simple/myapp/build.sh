oc new-build --binary=true -i s2i-builder-simple --name myapp

oc start-build myapp --from-dir=. 

oc logs bc/myapp -f

oc new-app myapp

oc get pod

