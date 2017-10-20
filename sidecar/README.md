# Example of a pod with two containers running together inside

Create a project and execute the run.sh script to create a pod with two containers running inside.

```
oc new-project sidecartest
./run.sh
```

First a DeploymentConfiguration is created called sidecars.  The configuration contains the following 2 containers:

```
  template:
    spec:
      containers:
      - image: 172.30.1.1:5000/yourproject/container1:latest
        name: container1
      - image: 172.30.1.1:5000/yourproject/container2:latest
        name: container2
        ports:
        - containerPort: 2000
          protocol: TCP
```

Both images are built by uploading the Dockerfiles (binary build).  Once the images have been created and pushed, the pod is created. 

Container 2 is listening on port 2000 and echos back (cat) whattever it receives.

Container 1 sends the date to port 2000 on localhost and the date is echoed.

Use the following command to view the log showing the date being send to container 2 and being received by container 1:

```
oc logs `oc get po | grep ^sidecars | awk '{print $1}'` -c container1 -f
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Fri Oct 20 01:02:37 UTC 2017
Connection closed by foreign host.
Trying 127.0.0.1...
Connected to localhost.
...
```

