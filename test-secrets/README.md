# Trying out secrets

Secrets can be created in different ways. For this topic, we will create 2 secrets from files in a folder.  First, create the secret data on disk. 

```
mkdir secrets
echo password1 > secrets/pw1
echo password2 > secrets/pw2
```

Something to be aware of with secrets is that if the user gets access
to the pod (e.g., by using the oc rsh command), the user will be
able to see the contents of the secrets either in the environment
variables or in the volume mounts. While the secrets mechanism
ensures that the data in the secret is never stored at rest on the
node, it is the user’s responsibility to ensure the secrecy of the contents.

It is recommended that the contents of the secret be encrypted or
obfuscated before creation. Secrets are stored internally in the etcd
datastore as Base64-encoded strings which may not be secure
enough in certain environments.

Now create the secret in OCP.  The secret data will be stored in etcd, base64-encoded. 

```
oc secrets new my-secret secrets/

oc get secret/my-secret

oc describe secret/my-secret
```

Now, if not already, launch a pod and deployment configutation using a test app.

```
oc new-app https://github.com/openshift/nodejs-ex
```

Set the secret as an environment variable inside the pod.  We set this on the DC, which will make the DC re-launch the pod. 

```
oc set env dc/nodejs-ex --from=secret/my-secret
```

Secrets can also be mounted into a container like this.  After the pod has been refreshed, the secret data can be found under /data.

```
oc volume dc/nodejs-ex --add --name=v1 --type=secret --secret-name=my-secret --mount-path=/data
```

Remote shell into the container and see the environment variable with the secret content.

```
oc get po
rsh nodejs-ex-2-vcx59
$ env | grep pw
$ more /data/* | cat 
```

