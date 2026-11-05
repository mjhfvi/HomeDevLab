task = BashOperator(
    task_id='dynamic_hello',
    bash_command='echo Hello world, today is {{ ds }}!',
    dag=dag
)
