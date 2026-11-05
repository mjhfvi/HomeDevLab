
from airflow import DAG
from datetime import datetime
from airflow.providers.cncf.kubernetes.operators.pod import KubernetesPodOperator

with DAG(
    dag_id='k8s_pod_exec_hello_world',
    start_date=datetime(2026, 11, 5),
    schedule=None,
    catchup=False,
    tags=['example', 'KubernetesPodOperator'],
) as dag:

    k8s_hello_world = KubernetesPodOperator(
        task_id='airflow_k8s_exec_hello_world',
        namespace='automation',
        image='hello-world:latest',
        cmds=['bash', '-cx'],
        arguments=['echo Hello World from KubernetesPodOperator!'],
        # deferrable=True,
        in_cluster=True,
    )
