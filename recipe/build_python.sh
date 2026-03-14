set -ex

pushd bson
$PYTHON -m pip install . -vv --no-build-isolation --no-deps
popd

pushd src/zaber-motion/py
$PYTHON $RECIPE_DIR/filter_setup.py
$PYTHON -m pip install . -vv --no-build-isolation --no-deps
popd

# Ensures that conda list reports that the package is installed by conda and not by pypi
cat ${SP_DIR}/zaber_bson-0.1.0.dist-info/RECORD >> ${SP_DIR}/zaber_motion-${PKG_VERSION}.dist-info/RECORD
rm ${SP_DIR}/zaber_bson-0.1.0.dist-info/RECORD
