#!/bin/bash -ex

oc process -f sidecars.yaml | oc create -f -

oc new-build --binary=true --name container1
oc new-build --binary=true --name container2

oc start-build container1 --from-dir=container1/
oc start-build container2 --from-dir=container2/

