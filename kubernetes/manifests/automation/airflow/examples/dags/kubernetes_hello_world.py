from airflow.providers.cncf.kubernetes.operators.pod import KubernetesPodOperator

submit_task = KubernetesPodOperator(
    task_id='run_container_task',
    name='airflow-worker-container-task',
    namespace='automation',
    image='hello-world:latest',
    cmds=['Hello World!'],
    in_cluster=True,  # Tells Airflow to use its own K8s service account
    get_logs=True,
)
