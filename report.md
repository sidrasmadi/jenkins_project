# Lab 10 - Part 4 Report
Sidra Smadi

## Changes made to the Jenkinsfile

- Added coverage and bandit to requirements.txt (also added pytest since the Test stage uses it).
- **Coverage stage**: runs the tests with `coverage run -m pytest` then prints the report with `coverage report -m`.
- **Security Scan stage**: runs `bandit -r app.py` to check the code for security issues.
- **Deploy stage**: now calls `deploy.bat`, a simple local deployment script that copies app.py into a `deploy/` folder and runs it.
- Jenkins is running on Windows so I changed the `sh` steps to `bat`, used `venv\Scripts\activate` instead of `source venv/bin/activate`, and added Python to PATH in the environment block.

Pipeline stages are now: Setup -> Lint -> Test -> Coverage -> Security Scan -> Deploy

## Jenkins output

Build #2 of the Python-CI-CD job finished with **SUCCESS** (build #1 failed because I forgot to escape the backslashes in the PATH line, fixed that and ran it again).

**Lint**
```
C:\ProgramData\Jenkins\.jenkins\workspace\Python-CI-CD>call venv\Scripts\activate   && flake8 app.py 
```
no flake8 errors

**Test**
```
tests\test_app.py .                                                      [100%]

============================== 1 passed in 0.08s ==============================
```

**Coverage**
```
Name                Stmts   Miss  Cover   Missing
-------------------------------------------------
app.py                  4      1    75%   6
tests\__init__.py       0      0   100%
tests\test_app.py       7      1    86%   12
-------------------------------------------------
TOTAL                  11      2    82%
```

**Security Scan**
```
Test results:
	No issues identified.
	Total issues (by severity):
		Undefined: 0
		Low: 0
		Medium: 0
		High: 0
```

**Deploy**
```
        1 file(s) copied.
app.py copied to deploy
Hello, World from Sidra Smadi!
```

```
Finished: SUCCESS
```

Full console log is in output/jenkins_build_2_console.txt
