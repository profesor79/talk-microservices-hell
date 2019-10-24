#!/bin/bash
echo 'curl http://auth-service-identity-server:5000/.well-known/openid-configuration'

kubectl run --generator=run-pod/v1 tmp-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash


