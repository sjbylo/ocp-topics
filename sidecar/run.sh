#!/bin/bash -x

#oc new-project sidecartest

oc process -f sidecars.yaml -p=PROJ=$(oc project -q) | oc create -f -

oc new-build --binary=true --name container1
oc new-build --binary=true --name container2

oc start-build container1 --from-dir=container1
oc start-build container2 --from-dir=container2

