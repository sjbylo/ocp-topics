# Build with docker 

docker login docker.io -u sjbylo
docker build . -t sjbylo/netcat-echo
docker run -it --rm sjbylo/netcat-echo -p 2000:2000
docker push sjbylo/netcat-echo

# Docker build on OpenShift

oc new-build --binary --name netcat-echo 
oc start-build netcat-echo --from-dir=.
oc logs bc/netcat-echo -f
oc new-app netcat-echo

