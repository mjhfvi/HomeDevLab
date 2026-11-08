# Postgresql

## Check Flux reconciliation

flux get kustomizations postgresql

## Verify the operator

kubectl get pods -n postgresql -l app.kubernetes.io/name=cloudnative-pg

## Check PostgreSQL cluster status

kubectl get cluster -n postgresql

## View cluster details

kubectl describe cluster pg-cluster -n postgresql

## Check PostgreSQL pod status

kubectl get pods -n postgresql -l cnpg.io/cluster=pg-cluster

## Connect to the current primary instance

kubectl exec -it -n postgresql svc/pg-cluster-rw -- psql -U postgres -d appdb

## Check replication status

kubectl exec -it -n postgresql svc/pg-cluster-rw -- psql -U postgres -c "SELECT * FROM pg_stat_replication;"
