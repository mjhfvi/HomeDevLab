# SKILL: IaC State & Resource Safety

## Core Requirements (Priority 3)

* **State & Lifecycle Isolation:** Assume a remote, locked backend for all Terraform structures. Apply lifecycle protections (`prevent_destroy = true`) on critical stateful infrastructure components (e.g., databases, root network configurations, persistent volumes).
* **Blast Radius Restriction:** Design Terraform modules to be tightly scoped and completely decoupled. Separate underlying structural resources from volatile application layers to minimize continuous delivery runtime impact.
