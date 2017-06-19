# Start the telnet pod

oc new-app sjbylo/telnet

# Start the "external" service (can start on the master or a node)

docker run -d -p 2000:2000 --name echo sjbylo/netcat-echo

# Create the service and the endpoint (the external endpoint)

oc create -f external-service.yaml
oc create -f external-endpoint.yaml

# Create the simple telnet image

docker build . -t sjbylo/telnet
docker run -it --rm --name telnet sjbylo/telnet bash

# Clean up

docker kill echo 

