mkdir secrets
echo password > secrets/pw1
echo password > secrets/pw2

oc secrets new my-secret secrets/

oc get secret/my-secret

oc describe secret/my-secret

oc set env dc/nodejs-ex --from=secret/my-secret

rsh nodejs-ex-2-vcx59

env | grep pw

