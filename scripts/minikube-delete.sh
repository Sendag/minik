#
# Description: delete postgres & restart minikube
# From WSL2 for U 24.04 terminal check docker with docker run hello-world

# Delete the Deployment
kubectl delete deployment postgres

# Delete the Services (both the ClusterIP and NodePort if you created it)
kubectl delete service postgres
kubectl delete service postgres-external

# Delete the ConfigMap
kubectl delete configmap postgres-init-script

# Delete the Secret
kubectl delete secret postgres-secrets

# Delete the PVC
kubectl delete pvc postgres-pvc

# Verify everything is deleted
kubectl get all | grep postgres
kubectl get configmap | grep postgres
kubectl get secret | grep postgres
kubectl get pvc | grep postgres