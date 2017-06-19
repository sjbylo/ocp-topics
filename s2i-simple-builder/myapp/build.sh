oc new-build s2i-simple-builder~. --context-dir=s2i-builder-simple/myapp --name myapp

oc logs bc/myapp -f

oc new-app myapp

oc get pod

oc logs <pod>

# oc new-build --binary=true -i s2i-simple-builder --name myapp 
# oc start-build myapp --from-dir=. 
