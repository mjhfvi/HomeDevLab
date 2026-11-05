from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator

with DAG(
    dag_id='python_hello_world_example',
    start_date=datetime(2026, 11, 5),
    schedule=None,
    catchup=False,
    tags=['example', 'python'],
) as dag:

    hello_world_task = PythonOperator(
        task_id='hello_world_task',
        python_callable=print_hello,
    )

def print_hello():
    print('Hello World!')
