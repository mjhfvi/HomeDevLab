# Security & Pre-commit Hooks

## Pre-commit Overview

`pre-commit` is a framework for managing and maintaining multi-language pre-commit hooks. It helps ensure code quality and security by running checks before code is committed to the repository.
[website](https://pre-commit.com/hooks.html)

currently we support developers working on vscode in windows, so run the commands in CMD

## Installation & Setup

1. **Install pre-commit:**

   ```sh
   pip3 install pre-commit
   ```

2. **Install the git hooks:**

   ```sh
   cd {git-repository}
   pre-commit install
   ```

3. **Update hooks to latest versions:**

   ```sh
   pre-commit autoupdate
   ```

4. **Run all hooks manually (optional: used by devops for troubleshooting):**

   ```sh
   pre-commit run --all-files --verbose
   ```

## Secret Scanning

To scan for secrets in the codebase and generate a baseline file:

```sh
detect-secrets scan > .secrets.baseline
```

## Additional Notes

- The configuration for pre-commit hooks is in `.pre-commit-config.yaml`.
- Hooks include checks for trailing whitespace, end-of-file, debug statements, requirements files, secrets, and more.
- All team members should install and use pre-commit to maintain code quality and security.

For more details, see [pre-commit documentation](https://pre-commit.com/).

## see output logs

show Command output
