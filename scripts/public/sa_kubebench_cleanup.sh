<<<<<<< HEAD

set +x
if [ "$#" -ne 5 ]; then
    echo "Required arguments missing!"
=======
#*******************************************************************************
# * Licensed Materials - Property of IBM
# * IBM Bluemix Container Service, 5737-D43
# * (C) Copyright IBM Corp. 2017 All Rights Reserved.
# * US Government Users Restricted Rights - Use, duplication or 
# * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#******************************************************************************

# To check if helm is installed on system or not.
command -v helm >/dev/null 2>&1 || { echo >&2 "helm is required. Aborting."; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo >&2 "kubectl is required. Aborting."; exit 1; }

# To check what version of helm is installed on system.
helmVer=`helm version --template {{.Version}}`
helmVerMajor="$(cut -d'.' -f 1 <<< ${helmVer:1})"

# CLI Arguments check
if [ "$#" -ne 5 ]; then
    if [ "$#" -lt 5 ]; then
        echo "Required arguments missing!"
    else
        echo "Wrong usage!"
    fi
>>>>>>> c040036... sdk integration complete
    echo "Usage : ./$(basename "$0") <account id> <api key> <full path to directory of kube configs> <cloud-env> <sa-endpoint>"
    exit 1
fi

<<<<<<< HEAD
=======
# Arguments assignment
>>>>>>> c040036... sdk integration complete
account_id=$1
api_key=$2
kube_config_dir=$3
sa_endpoint=$4
cloud_env=$5

<<<<<<< HEAD
kubeconfig_name=$(ls $kube_config_dir |grep yml)

python src/$cloud_env/kubeBenchCleanup.py $account_id $api_key $sa_endpoint

kubectl delete secret kubebench-public-secret
kubectl delete secret kubebench-public-credentials
helm del --purge kubebench-sa-adapter-public
podname=$(kubectl get job |grep kubebench-sa-adapter|awk '{ print $1 }')
kubectl delete job $podname

# Delete kube-bench Job running on target cluster: 
export KUBECONFIG=$kube_config_dir/$kubeconfig_name
kubectl delete job kube-bench
=======
# Remove notes and occurrences emitted by kube-bench
python3 src/$cloud_env/kubeBenchCleanup.py $account_id $api_key $sa_endpoint

# Delete secrets from target cluster
kubectl delete secret kubebench-public-secret
kubectl delete secret kubebench-public-credentials

# Delete kube-bench Job running on target cluster: 
kubeconfig_name=$(ls $kube_config_dir |grep yml)
export KUBECONFIG=$kube_config_dir/$kubeconfig_name
kubectl delete job kube-bench-public
kubectl delete cronjob kubebench-sa-adapter-public

# Remove helm chart from target cluster
if [ $helmVerMajor -gt 2 ]; then
    helm uninstall kubebench-sa-adapter-public
else
    helm del --purge kubebench-sa-adapter-public .
fi
>>>>>>> c040036... sdk integration complete
