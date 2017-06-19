# Trying out NodePort 

This topic covers launching a simple container with listens on port 2000 and echos whattever it typed.

```
apiVersion: v1
kind: Service
metadata:
  labels:
    app: myapp
  name: myapp-external
spec:
  ports:
  - port: 8080
    targetPort: 8080
    nodePort: 30000
  selector:
    deploymentconfig: netcat-echo 
  sessionAffinity: None
  type: "NodePort"
```

