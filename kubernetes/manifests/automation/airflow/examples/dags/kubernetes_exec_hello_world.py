
import pendulum
from airflow import DAG
from datetime import datetime
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator
from airflow.providers.cncf.kubernetes.operators.pod_exec import KubernetesPodExecOperator

with DAG(
    dag_id='k8s_pod_exec_hello_world',
    start_date=datetime(2026, 11, 5),
    schedule=None,
    catchup=False,
    tags=['example', 'KubernetesPodExecOperator'],
) as dag:

    k8s_hello_world = KubernetesPodExecOperator(
        task_id='airflow_k8s_exec_hello_world',
        image='hello-world:latest',
        pod_name='airflow_k8s_exec_operator',
        pod_namespace='automation',
        command=['echo', 'Hello World from KubernetesPodExecOperator!'],
    )
