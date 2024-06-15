@echo ON
setlocal enabledelayedexpansion
cd src/zaber-motion

set GO111MODULE=on

set zaber_motion_libname=zaber-motion-lib
set zaber_motion_lib=%zaber_motion_libname%.dll
set zaber_motion_header=%zaber_motion_libname%.h
go mod tidy
if errorlevel 1 exit 1
go build -buildmode=c-shared -o ./build/%zaber_motion_lib%
if errorlevel 1 exit 1

dir build

copy build\%zaber_motion_lib% %LIBRARY_BIN%\.
if errorlevel 1 exit 1
copy build\%zaber_motion_header% %LIBRARY_INC%\.
if errorlevel 1 exit 1
