set -ex
cd src/zaber-motion

pushd py

$PYTHON $RECIPE_DIR/filter_setup.py
$PYTHON -m pip install . -vv
popd

