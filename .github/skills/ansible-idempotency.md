# SKILL: Idempotent Configuration Management

## Core Requirements (Priority 3)

* **Declarative Automation:** When constructing Ansible playbooks or roles, prioritize declarative native modules over generic execution tasks (e.g., use `ansible.builtin.apt` instead of `shell: apt-get install`).
* **State Enforcement & Recovery:** Explicitly declare targeted entity states (`state: present`, `state: started`). Wrap volatile operations in structured `block`, `rescue`, and `always` sequences to guarantee complete idempotency and fault isolation.
