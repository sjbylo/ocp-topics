oc new-project go-chained-example
oc import-image jorgemoralespou/s2i-go --confirm

oc new-build s2i-go~https://github.com/sjbylo/ocp-topics \
   --context-dir=/s2i-go-chained-builder/hello_world \
   --name=builder

sleep 1

# watch the logs
oc logs -f bc/builder --follow

# Generated artifact is located in /opt/app-root/src/go/src/main/main
oc new-build --name=runtime \
   --docker-image=openshift/base-centos7 \
   --source-image=builder \
   --source-image-path=/opt/app-root/src/go/src/main/main:. \
   --dockerfile=$'FROM openshift/base-centos7\nCOPY main /main\nEXPOSE 8080\nENTRYPOINT ["/main"]' \
   --strategy=docker

sleep 2

until oc logs -f bc/runtime --follow; do sleep 1; done

sleep 2

# Deploy and expose the app once built
oc new-app runtime --name=my-application
oc expose svc/my-application

# Print the endpoint URL
echo “Access the service at http://$(oc get route/my-application -o jsonpath='{.status.ingress[0].host}')/” 
