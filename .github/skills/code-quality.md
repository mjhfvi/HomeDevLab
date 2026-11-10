# SKILL: Code Quality & Maintainability Gatekeeper

## Core Requirements (Priority 2)

* **Low Cognitive Complexity:** Keep functions, loops, and playbooks clean. Reject deep nesting and sprawling monolithic code blocks. Extract complex logic into modular helper units.
* **Self-Documenting Structure:** Use precise, fully descriptive naming conventions for variables and components. Eliminate magic numbers or undocumented literals by defining explicitly typed constants or configuration parameters.
* **Robust Boundary Handling:** Enforce explicit error catching, proper validation conditions, and standard logging practices instead of swallowing exceptions or errors.
