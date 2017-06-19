# Simply pull the netcat-echo application from docker hub and launch it on OpenShift.
oc new-app sjbylo/netcat-echo 

# Docker build on OpenShift

oc new-build --binary --name netcat-echo 
oc start-build netcat-echo --from-dir=.
oc logs bc/netcat-echo -f
oc new-app netcat-echo

# Build with plain docker 

docker build . -t sjbylo/netcat-echo
docker run -d -p 2000:2000 --name echo sjbylo/netcat-echo 
docker kill echo 

# Push to docker hub

docker login docker.io -u sjbylo
docker push sjbylo/netcat-echo

