# Airflow

## Install with Helm

```bash
helm install airflow apache-airflow/airflow --namespace automation --values values.yaml
helm upgrade airflow apache-airflow/airflow --namespace automation --values values.yaml
```
