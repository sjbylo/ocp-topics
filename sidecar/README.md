# Example of a pod with two containers running together inside

Execute the run.sh script to create a pod with two containers running inside.

First a DeploymentConfiguration is created called sidecars.  The configuration contains the following 2 containers:

```
  template:
    spec:
      containers:
      - image: 172.30.1.1:5000/csl/container1:latest
        name: container1
      - image: 172.30.1.1:5000/csl/container2:latest
        name: container2
        ports:
        - containerPort: 2000
          protocol: TCP
```

Both images are built by uploading the Dockerfiles (binary build).  Once the images have been created and pushed, the pod is created. 

Container 2 is listening on port 2000 and echos whattever it receives.

Conteiner 1 sends the date to port 2000 on localhost and the date is echoed.

Use the following command to view the log showing the date:

```
oc logs `oc get po | grep ^sidecars | awk '{print $1}'` -c container1 -f
```

