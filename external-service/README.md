# Test connectivity to an external service

This topic covers the use of a service to allow pods to connect to external services.

## Start a test external service, e.g. on the master or on a node.  

```
docker run -d -p 2000:2000 --name echo sjbylo/netcat-echo
```
Note down the ip address of the node where this service is listening on (cannot use localhost).

## Start a simple pod containing telnet from which connectivity will be tested.

```
oc new-app sjbylo/telnet
```

## Create the service to represent the external service.

```
kind: "Service"
apiVersion: "v1"
metadata:
  name: "external-echo-service"
spec:
  ports:
    -
      name: "echo"
      protocol: "TCP"
      port: 2000
      targetPort: 2000
      nodePort: 0
selector: {}
```
Note that the difference beetween a normal service obeject and this one is that the selector is blank. This service will not need to track any pods.  One or more endpoints must be added for the service to work.

## Create the service object. 

```
oc create -f external-service.yaml
```

## Next, create the endpoint which points to the external IP and port.

Define the yaml file and set the correct IP address of the external service you noted earlier.  

```
kind: Endpoints
apiVersion: "v1"
metadata:
  name: "external-echo-service" 
subsets: 
  -
    addresses:
      -
        ip: "192.168.10.213" 
    ports:
      -
        port: 2000 
        name: "echo"
```

## Create the endpoint. 

```
oc create -f external-endpoint.yaml
```

## Test it

Enter the telnet pod and try to connect to the external service via the static service hostname, "external-echo-service".  The hostname will resolve to the IP address configured in the endpoint. 

```
oc rsh <telnet pod>
$ telnet external-echo-service 2000
Trying 172.30.192.141...
Connected to external-echo-service.
Escape character is '^]'.
1 2 3 4
1 2 3 4
^]
telnet> quit
Connection closed.
```

A connection should be made to the netcat-echo service on port 2000, which is running outside the cluster. 

See the [documentation](https://docs.openshift.com/container-platform/3.5/dev_guide/integrating_external_services.html#using-an-ip-address-and-endpoints)
