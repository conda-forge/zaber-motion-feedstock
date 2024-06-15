set -ex
cd src/zaber-motion

pushd py

# without the __init__ file, it won't install correctly
touch zaber_motion/protobufs/__init__.py

$PYTHON $RECIPE_DIR/filter_setup.py
$PYTHON -m pip install . -vv
popd

