# https://airflow.apache.org/docs/apache-airflow-providers-standard/stable/_modules/index.html
from datetime import datetime
from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator

with DAG(
    dag_id='bash_hello_world_example',
    start_date=datetime(2026, 11, 5),
    schedule=None,
    catchup=False,
    tags=['example', 'bash'],
) as dag:

  task = BashOperator(
      task_id='bash_hello',
      bash_command='echo Hello world bash!',
      dag=dag
  )
