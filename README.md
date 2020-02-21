# security-advisor-k8s-bench-integration

<<<<<<< HEAD
![Definition of Terms](https://github.com/ibm-cloud-security/security-advisor-k8s-bench-integration/blob/master/kube-definitions.png) 

# Prerequisites 
- Install python (Only if you want to do the cleanup of cards, notes and occurances)
- Install [Kubernetes Helm (package manager)](https://docs.helm.sh/using_helm/#from-script) v2.9.0 or higher
- Install oc-client plugin on mac: https://cloud.ibm.com/docs/openshift?topic=openshift-openshift-cli#cli_oc
- You need to have an IBM Cloud account where you are able to navigate to IBM Cloud Security Advisor Dashboard. Account ID and other account details refered in this document is corresponding to that account

=======
## Definition of terms:

![Definition of Terms](https://github.com/ibm-cloud-security/security-advisor-k8s-bench-integration/blob/master/kube-definitions.png) 

## Prerequisites 
- An installation of Python *>=3.5* on your local machine (Only if you want to do the cleanup of cards, notes and occurrences).
- An installation of [Helm Package Manager](https://docs.helm.sh/using_helm/#from-script) *>=2.9.0* for Kubernetes.
- An installation of [OpenShift Origin CLI](https://cloud.ibm.com/docs/openshift?topic=openshift-openshift-cli#cli_oc).
- You need to have an IBM Cloud account where you are able to navigate to IBM Cloud Security Advisor Dashboard. Account ID and other account details refered in this document is corresponding to that account.

<hr>
>>>>>>> c040036... sdk integration complete

## public-k8s cloud 
### Install steps for public-k8s cloud:
- Clone this repo
<<<<<<< HEAD
- `cd security-advisor-k8s-bench-integration/scripts/public`
- Inorder to point to security advisor london endpoint do following changes:
  uncomment line#14 and comment line#13 in /config/helm/kubebench-adapter/values.yaml 
- `./sa_kubebench_install.sh <account-id> <apikey> <target-clustername> "<complete path of kubeconfig of target cluster>"`
=======
- `cd security-advisor-k8s-bench-integration`
- Inorder to point to security advisor london endpoint do following changes:
  uncomment line#14 and comment line#13 in /config/helm/kubebench-adapter/values.yaml 
- `sh ./scripts/public/sa_kubebench_install.sh <account-id> <apikey> <target-clustername> <complete-path-of-kubeconfig-of-target-cluster>`
>>>>>>> c040036... sdk integration complete
- for example: 
```
./sa_kubebench_install.sh account_id apikey mycluster "/Users/sunilsingh/.bluemix/plugins/container-ser-ice/clusters/mycluster"

<account-id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target public k8s cluster on which kube-bench needs to be configured 
<<<<<<< HEAD
<complete path of kubeconfig of target cluster>: Run `ibmcloud cs cluster-config <clustername>` to get kube-config
```

### Cleanup setup for public-k8s cloud:
- `cd security-advisor-k8s-bench-integration/scripts/public`
- Run below automated script to cleanup all in once.
`./sa_kubebench_cleanup.sh <account id> <api key> "full path to directory of kube configs>" <cloud-env>`
- For example: 
 ```
 ./sa_kubebench_cleanup.sh  accountid apikey "/Users/sunilsingh/.bluemix/plugins/container-service/clusters/mycluster" ibmcloud

<account id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target public k8s cluster on which kube-bench needs to be configured 
<complete path of kubeconfig of target cluster>: Run `ibmcloud cs cluster-config <clustername>` to get kube-config
<cloud-env>: Value is `ibmcloud`
```
=======
<complete-path-of-kubeconfig-of-target-cluster>: Run `ibmcloud ks cluster config <clustername>` to get kube-config
```

### Cleanup setup for public-k8s cloud:
- `cd security-advisor-k8s-bench-integration`
- Run below automated script to cleanup all in once.
`sh ./scripts/public/sa_kubebench_cleanup.sh <account-id> <apikey> <complete-path-of-kubeconfig-of-target-cluster> <sa-endpoint> <cloud-env>`
- For example: 
 ```
 ./sa_kubebench_cleanup.sh  accountid apikey "/Users/sunilsingh/.bluemix/plugins/container-service/clusters/mycluster" "https://us-south.secadvisor.cloud.ibm.com/findings" ibmcloud

<account-id>: Account id on which the card needs to be deleted
<apikey>: api-key of the above account-id.
<complete-path-of-kubeconfig-of-target-cluster>: Run `ibmcloud cs cluster-config <clustername>` to get kube-config
<sa-endpoint>: Endpoint of Security Advisor
<cloud-env>: Value is `ibmcloud`
```
<hr>
>>>>>>> c040036... sdk integration complete

## Redhat Openshift
### Install steps for source is public-k8s cloud and target is redhat-openshift cloud:
- Clone this repo
<<<<<<< HEAD
- `cd security-advisor-k8s-bench-integration/scripts/redhat`
- Inorder to point to security advisor london endpoint do following changes:
  uncomment line#14 and comment line#13 in /config/helm/kubebench-adapter/values.yaml 
- `./sa_kubebench_install.sh <account-id> <api key> <target-clustername> <oc login api-key>`
- for example: 
```
./sa_kubebench_install.sh account_id apikey mycluster-rhel "oc-login-api-key"
=======
- `cd security-advisor-k8s-bench-integration`
- Inorder to point to security advisor london endpoint do following changes:
  uncomment line#14 and comment line#13 in /config/helm/kubebench-adapter/values.yaml 
- `sh ./scripts/public/sa_kubebench_install.sh <account-id> <apikey> <target-clustername> <oc login api-key>`
- for example: 
```
./sa_kubebench_install.sh account-id apikey mycluster-rhel "oc-login-api-key"
>>>>>>> c040036... sdk integration complete

<account-id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target rhel-openshift cluster on which kube-bench needs to be configured 
<oc-login-api-key>: The api-key to login to cluster
```

### Cleanup of setup for source is public-k8s cloud and target is redhat-openshift cloud:
- Clone this repo
<<<<<<< HEAD
- `cd security-advisor-k8s-bench-integration/scripts/redhat`
- Run below automated script to cleanup all in once.
- `./sa_kubebench_cleanup.sh <account id> <apikey> <target-clustername> <oc-login-api-key> <sa-endpoint>`
-  For example: 
```
./sa_kubebench_cleanup.sh  accountid apikey myrhelcluster oc-login-apikey "https://us-south.secadvisor.cloud.ibm.com/findings/v1"

<account id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target rhel-openshift cluster on which kube-bench needs to be configured 
<oc-login-api-key>: The api-key to login to cluster
<sa-endpoint>: The value is `https://us-south.secadvisor.cloud.ibm.com/findings/v1`
<source-server>: The value is `redhat`
=======
- `cd security-advisor-k8s-bench-integration`
- Run below automated script to cleanup all in once.
- `sh ./scripts/public/sa_kubebench_cleanup.sh <account-id> <apikey> <target-clustername> <oc-login-api-key> <sa-endpoint> <cloud-env>`
-  For example: 
```
./sa_kubebench_cleanup.sh  accountid apikey myrhelcluster oc-login-apikey "https://us-south.secadvisor.cloud.ibm.com/findings" redhat

<account-id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target rhel-openshift cluster on which kube-bench needs to be configured 
<oc-login-api-key>: The api-key to login to cluster
<sa-endpoint>: The value is `https://us-south.secadvisor.cloud.ibm.com/findings`
<cloud-env>: The value is `redhat`
>>>>>>> c040036... sdk integration complete
```

### Install steps for source and target as redhat-openshift cloud:
- Clone this repo
<<<<<<< HEAD
- `cd security-advisor-k8s-bench-integration/scripts/redhat`
- Inorder to point to security advisor london endpoint do following changes:
  uncomment line#14 and comment line#13 in /config/helm/kubebench-adapter/values.yaml 
- `./sa_kubebench_install.sh <account id> <api key> <cluster name> <oc login api-key> redhat`
- for example: 
```
./sa_kubebench_install.sh account_id apikey mycluster-rhel "oc login api-key" redhat

<account id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target rhel-openshift k8s cluster on which kube-bench needs to be configured 
<oc-login-api-key>: The api-key to login to cluster
=======
- `cd security-advisor-k8s-bench-integration`
- Inorder to point to security advisor london endpoint do following changes:
  uncomment line#14 and comment line#13 in /config/helm/kubebench-adapter/values.yaml 
- `sh ./scripts/redhat/sa_kubebench_install.sh <account-id> <apikey> <target-clustername> <oc-login-api-key> <cloud-env>`
- for example: 
```
sh ./scripts/redhat/sa_kubebench_install.sh account_id apikey mycluster-rhel "oc login api-key" redhat

<account-id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target rhel-openshift k8s cluster on which kube-bench needs to be configured 
<oc-login-api-key>: The api-key to login to cluster
<cloud-env>: The value is `redhat`
>>>>>>> c040036... sdk integration complete
```

### Cleanup of setup for source and target as redhat-openshift:

- Clone this repo
<<<<<<< HEAD
- `cd security-advisor-k8s-bench-integration/scripts/redhat`
- Run below automated script to cleanup all in once.
- `./sa_kubebench_cleanup.sh <account id> <api key> <target-clustername> <oc-login-api-key> <sa-endpoint> <source-server>`
-  For example: 
```
./sa_kubebench_cleanup.sh  accountid apikey mycluster-rhel oc-login-apikey "https://us-south.secadvisor.cloud.ibm.com/findings/v1 redhat"

<account id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target rhel-openshift cluster on which kube-bench needs to be configured 
<oc-login-api-key>: The api-key to login to cluster
<sa-endpoint>: The value is `https://us-south.secadvisor.cloud.ibm.com/findings/v1`
<source-server>: The value is `redhat`
```
=======
- `cd security-advisor-k8s-bench-integration`
- Run below automated script to cleanup all in once.
- `sh ./scripts/redhat/sa_kubebench_cleanup.sh <account-id> <apikey> <target-clustername> <oc-login-api-key> <sa-endpoint> <cloud-env>`
-  For example: 
```
sh ./scripts/redhat/sa_kubebench_cleanup.sh  accountid apikey mycluster-rhel oc-login-apikey "https://us-south.secadvisor.cloud.ibm.com/findings redhat"

<account-id>: Account id on which the card needs to be generated
<apikey>: api-key of the above account-id.
<target-clustername>: The target rhel-openshift cluster on which kube-bench needs to be configured 
<oc-login-api-key>: The api-key to login to cluster
<sa-endpoint>: The value is `https://us-south.secadvisor.cloud.ibm.com/findings`
<cloud-env>: The value is `redhat`
```
<hr>
>>>>>>> c040036... sdk integration complete

## Configure cronjob:
- The cronjobs are scheduled to run every 15 mins, which is configurable. Change the schedule to run the cronjobs at: 
```
https://github.com/ibm-cloud-security/security-advisor-k8s-bench-integration/blob/master/config/helm/kubebench-adapter-public/templates/kube-cronjob.yaml#L8
```

<<<<<<< HEAD
## Troubleshooting

1. If you get an error something like `Error: incompatible versions client and server`, run `helm init --upgrade`
2. If you get an error like : `namespaces security-advisor-insights is forbidden: User system:serviceaccount:kube-system:default cannot get resource namespaces in API group in thenamespace security-advisor-insights`, fix the helm using [helm setup](https://cloud.ibm.com/docs/containers?topic=containers-integrations#helm) or follow below steps:
   ```kubectl delete deployment tiller-deploy -n kube-system
=======
<hr>

## Troubleshooting

1. If you get an error something like `Error: incompatible versions client and server`, run `helm init --upgrade`
2. If you get an error like : `namespaces security-advisor-insights is forbidden: User system:serviceaccount:kube-system:default cannot get resource namespaces in API group in the namespace security-advisor-insights`, fix the helm using [helm setup](https://cloud.ibm.com/docs/containers?topic=containers-integrations#helm) or follow below steps:
   ```
   kubectl delete deployment tiller-deploy -n kube-system
>>>>>>> c040036... sdk integration complete
   kubectl apply -f https://raw.githubusercontent.com/IBM-Cloud/kube-samples/master/rbac/serviceaccount-tiller.yaml
   helm init --service-account tiller
   kubectl get pods -n kube-system -l app=helm
   helm list
   ```
