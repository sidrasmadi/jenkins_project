# Lab 10 - Part 4 Report
Sidra Smadi

## Changes made to the Jenkinsfile

- Added coverage and bandit to requirements.txt (also added pytest since the Test stage uses it).
- **Coverage stage**: runs the tests with `coverage run -m pytest` then prints the report with `coverage report -m`.
- **Security Scan stage**: runs `bandit -r app.py` to check the code for security issues.
- **Deploy stage**: now calls `deploy.bat`, a simple local deployment script that copies app.py into a `deploy/` folder and runs it.

- Jenkins is running on Windows so I changed the `sh` steps to `bat`, used `venv\Scriptsctivate` instead of `source venv/bin/activate`, and added Python to PATH in the environment block.

Pipeline stages are now: Setup -> Lint -> Test -> Coverage -> Security Scan -> Deploy

## Jenkins output

