set -ex
SHORT_OS_STR=$(uname -s)
cd src/zaber-motion

# Build Go package
export GO111MODULE=on

zaber_motion_libname=zaber-motion-lib
zaber_motion_lib=${zaber_motion_libname}${SHLIB_EXT}
zaber_motion_header=${zaber_motion_libname}.h
go build -buildmode=c-shared -o ./build/${zaber_motion_lib}

# Copy the files in the correct locations
cp build/${zaber_motion_lib} $PREFIX/lib/.
cp build/${zaber_motion_header} $PREFIX/include/.
