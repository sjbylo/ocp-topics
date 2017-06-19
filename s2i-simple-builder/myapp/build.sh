oc new-build s2i-simple-builder~. --context-dir=s2i-simple-builder/myapp --name myapp

oc logs bc/myapp -f

oc new-app myapp

oc get pod

#oc logs <pod>

# Alternative way ...
oc new-app s2i-simple-builder~https://github.com/sjbylo/ocp-topics \
   --context-dir s2i-simple-builder/myapp --name myapp2

# or...

# oc new-build --binary=true -i s2i-simple-builder --name myapp 
# oc start-build myapp --from-dir=. 
