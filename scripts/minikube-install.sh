# Prerequisites: curl, kubectl, docker
# Description: Install minikube
# From WSL2 for U 24.04 terminal check docker with docker run hello-world


# Download minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Make it executable
chmod +x ./minikube

# Move to path
sudo mv ./minikube /home/sg/bin/

# Set Docker as the default driver
minikube config set driver docker

# Download kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make it executable
chmod +x kubectl

# Move to path
sudo mv kubectl /home/sg/bin/
#start minikube - Done kubectl is now configured message will be displayed
minikube start

# Check minikube status
minikube status

# Check kubectl configuration
kubectl get nodes
# Access minikube dashboard-- run below command to access dashboard
minikube dashboard