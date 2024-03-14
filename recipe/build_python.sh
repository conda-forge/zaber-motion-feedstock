set -ex
cd src/zaber-motion

# Now compile the python bindings
protoc -I=. --python_out="py/zaber_motion" \
  --plugin="protoc-gen-mypy=tools/protoc-gen-mypy" \
  --mypy_out="py/zaber_motion" protobufs/main.proto

pushd py

# without the __init__ file, it won't install correctly
touch zaber_motion/protobufs/__init__.py

$PYTHON $RECIPE_DIR/filter_setup.py
$PYTHON -m pip install . -vv
popd

