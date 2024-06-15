set -ex

pushd bson
$PYTHON -m pip install . -vv --no-build-isolation --no-deps
popd

pushd src/zaber-motion/py
$PYTHON $RECIPE_DIR/filter_setup.py
$PYTHON -m pip install . -vv --no-build-isolation --no-deps
popd

