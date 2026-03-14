@echo ON
setlocal enabledelayedexpansion

pushd bson
%PYTHON% -m pip install . -vv --no-build-isolation --no-deps
popd

pushd src/zaber-motion/py

%PYTHON% %RECIPE_DIR%\filter_setup.py
if errorlevel 1 exit 1

%PYTHON% -m pip install . -vv --no-build-isolation --no-deps
if errorlevel 1 exit 1

popd

REM Ensures that conda list reports that the package is installed by conda and not by pypi
type %SP_DIR%\zaber_bson-0.1.0.dist-info\RECORD >> %SP_DIR%\zaber_motion-%PKG_VERSION%.dist-info\RECORD
del %SP_DIR%\zaber_bson-0.1.0.dist-info\RECORD
