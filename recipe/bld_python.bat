@echo ON
setlocal enabledelayedexpansion
cd src/zaber-motion/py

%PYTHON% %RECIPE_DIR%\filter_setup.py
if errorlevel 1 exit 1

%PYTHON% -m pip install . -vv --no-build-isolation --no-deps
if errorlevel 1 exit 1

cd ..\..\..
