#
# Description: start minikube
# From WSL2 for U 24.04 terminal check docker with docker run hello-world

# Start minikube
minikube status
# If not running
minikube start
#check minikube pods
kubectl get pods
# Apply the Secret
kubectl apply -f k8s/postgres-secrets.yaml
# Check environment variables in the pod
kubectl exec -it <postgres-pod-name> -- env | grep POSTGRES
# Apply the ConfigMap
kubectl apply -f k8s/postgres-init-script-configmap.yaml
# Apply the PVC
kubectl apply -f k8s/postgres-pvc.yaml
# Apply the Deployment
kubectl apply -f k8s/postgres-deployment.yaml
# Apply the Service
kubectl apply -f k8s/postgres-service.yaml
# Apply the NodePort or do a port forwarding to access the database
#kubectl port-forward service/postgres 5432:5432
kubectl apply -f k8s/postgres-nodeport.yaml
minikube ip
# Use the output IP with port 30432, e.g., 192.168.49.2:30432
# Check if the pod is running
kubectl get pods

# Check if PVC is bound
kubectl get pvc

# Check pod logs
kubectl logs $(kubectl get pods -l app=postgres -o name)

# Test database connection (install psql if needed)
PGPASSWORD=finalpass psql -h $(minikube ip) -p 30432 -U sendag -d aicldb

# Connect to the pod
kubectl exec -it <postgres-pod-name> -- bash

# Inside the pod, connect to PostgreSQL
psql -U sendag 

# List all databases
\l

# List all users
\du