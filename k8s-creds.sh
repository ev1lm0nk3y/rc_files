#!/bin/sh

cluster=${1}
listen_port=${listen_port:-443}

if [ -z "${cluster}" ]; then
    echo "Usage: ${0} <cluster-name>"
    exit 1
fi

if ! which aws 1>/dev/null; then
    echo "The aws CLI must be on your PATH."
    exit 1
fi

ca_cert=`mktemp`
cert=`mktemp`
key=`mktemp`

trap "rm -f ${ca_cert} ${cert} ${key}" 0

server=`aws elb describe-load-balancers \
    --load-balancer-names ${cluster} \
    --query 'LoadBalancerDescriptions[*].[DNSName]' \
    --output text`

[[ "$?" != 0 ]] && server=$(dig +short ${cluster} | head -1)

aws ssm get-parameters \
    --names /${cluster}/cluster/ca.crt \
    --with-decryption \
    --query 'Parameters[*].Value' \
    --output text > ${ca_cert}

aws ssm get-parameters \
    --names /${cluster}/controller/apiserver-kubelet-client.crt \
    --with-decryption \
    --query 'Parameters[*].Value' \
    --output text > ${cert}

aws ssm get-parameters \
    --names /${cluster}/controller/apiserver-kubelet-client.key \
    --with-decryption \
    --query 'Parameters[*].Value' \
    --output text > ${key}

kubectl config set-cluster ${cluster} \
    --certificate-authority=${ca_cert} \
    --server=https://${server}:${listen_port} \
    --embed-certs=true

kubectl config set-context admin@${cluster} \
    --cluster=${cluster} --user=admin

kubectl config use-context admin@${cluster}

kubectl config set-credentials admin \
    --client-certificate=${cert} \
    --client-key=${key} \
    --embed-certs=true
