@task.bash
def run_after_loop() -> str:
    return 'echo Hello World!'

run_this = run_after_loop()
