# Example of a pod with two containers running together inside

Execute the run.sh script to create a pod with two containers running inside.

First a DeploymentConfiguration is created called sidecars.  The configuration contains the following 2 containers:

```
  template:
    spec:
      containers:
      - image: 172.30.1.1:5000/csl/container1:latest
        name: container1
        terminationMessagePath: /dev/termination-log
      - image: 172.30.1.1:5000/csl/container2:latest
        name: container2
        ports:
        - containerPort: 2000
          protocol: TCP
```

Both images are built by uploading the Dockerfiles.  Once the images have been created and pushed, the pod is created. 
