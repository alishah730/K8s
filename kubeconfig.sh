
kubectl -n kube-system create serviceaccount kubeconfig-sa
kubectl create clusterrolebinding add-on-admin --clusterrole=cluster-admin --serviceaccount=kube-system:kubeconfig-sa
TOKENNAME=`kubectl -n kube-system get serviceaccount/kubeconfig-sa -o jsonpath='{.secrets[0].name}'`
kubectl get secret $TOKENNAME -o jsonpath={.data.token} --namespace=kube-system | base64 -d
