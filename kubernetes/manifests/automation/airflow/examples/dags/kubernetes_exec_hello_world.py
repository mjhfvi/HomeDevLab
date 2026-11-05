run_command = KubernetesPodExecOperator(
    task_id='run_command',
    pod_name='airflow_k8s_exec_operator',
    namespace='automation',
    container_name='airflow_k8s_exec_operator',
    command=['sh', '-c', f"printf 'Hello World!\\n'"],
    do_xcom_push=True,
)
