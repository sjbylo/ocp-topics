# Trying out NodePort 


TRY THIS ON AWS INSTANCE

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
    deploymentconfig: nodejs-ex
  sessionAffinity: None
  type: "NodePort"
```

