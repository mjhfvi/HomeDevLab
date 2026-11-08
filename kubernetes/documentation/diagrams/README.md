# Diagrams

## kube-diagrams

Source: [Github KubeDiagrams Project](https://github.com/philippemerle/KubeDiagrams/tree/main)

## Create Cluster Diagram

sudo apt install python3-pip graphviz -y
pip install KubeDiagrams

## generate a diagram of all workload and service resources from all namespaces

kubectl get all --all-namespaces -o yaml | kube-diagrams -o infrastructure.png -

## generate a diagram of same workload and service resources from same namespaces
