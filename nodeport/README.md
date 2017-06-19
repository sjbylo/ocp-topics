# Trying out NodePort 

This topic covers launching a simple container which listens on port 2000 and echos whatever is typed.

Launch the netcat-echo container.

```
oc new-app sjbylo/netcat-echo 
```

This will create a normal service object which provides a static IP/hostname for the set of netcat-echo pods and also load balances over the set. 

Have a look at the service which it tracking the netcat-echo pod(s).

```
oc get svc
```

This service is only accessible over the SDN and cannot be reached from outside the cluster. 

Now expose the pods using a service of type *nodeport*.  This makes OpenShift listen on port 30000 on all nodes.  After the pods have been exposed, try to telnet to the pods. 

```
apiVersion: v1
kind: Service
metadata:
  labels:
    app: netcat-echo
  name: netcat-echo-external
spec:
  ports:
  - port: 2000
    targetPort: 2000
    nodePort: 30000
  selector:
    deploymentconfig: netcat-echo 
  sessionAffinity: None
  type: "NodePort"
```

Create the nodeport service.

**Note: If you are trying this out in a group on the same OpenShift cluster, change the port from 30000 to another port somewhere between 30000 and 31000.  Remeber these ports cannot overlap, clusterwide. **

```
oc create -f nodeport.yaml
```

If you have access, notice the openshift process is now listening on port 30000. Note, that if there are more than one nodeport services in the cluster, they cannot use the same port since all nodes in the cluster must listen on each particular port.   They cannot overlap. 

```
# netstat -ltnp | grep 30000
```

From outside the cluster, try to connect to port 30000

```
telnet hostname-of-master-api-openshift 30000
Trying 52.221.38.230...
Connected to master.ocp.paas.bylo.de.
Escape character is '^]'.
1 2 3 4
1 2 3 4
^]
telnet> quit
Connection closed.
```
Note that all nodes of the OpenShift cluster must allow port 30000 (or a range from 30000 and 31000) to be open. 

Now remove the nodeport service and try to telnet again.

```
oc delete svc/netcat-echo-external
```

```
telnet hostname-of-master-api-openshift 30000
Trying 52.221.38.230...
telnet: connect to address 52.221.38.230: Connection refused
telnet: Unable to connect to remote host
```


