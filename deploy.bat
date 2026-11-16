@echo off
rem simple local deployment
set DEPLOY_DIR=deploy

if not exist %DEPLOY_DIR% mkdir %DEPLOY_DIR%
copy /Y app.py %DEPLOY_DIR%\
echo app.py copied to %DEPLOY_DIR%
python %DEPLOY_DIR%\app.py
