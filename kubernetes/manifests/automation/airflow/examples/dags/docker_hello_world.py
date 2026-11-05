from datetime import datetime
from airflow import DAG
from airflow.providers.docker.operators.docker import DockerOperator

with DAG(
    dag_id='docker_hello_world_dag',
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
) as dag:

    hello_world_task = DockerOperator(
        task_id='docker_hello_world',
        image='hello-world:latest',
        api_version='auto',
        auto_remove='success',
        docker_url='unix://var/run/docker.sock',
        network_mode='bridge',
    )
