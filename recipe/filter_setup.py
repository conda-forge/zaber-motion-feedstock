import ast
with open('setup.py') as f:
    text = f.read()

a = ast.parse(text)
expr = a.body[-1]
# Remove their install_requires and extra_requires
# since they pin to re and libprotobuf which we manage differently
expr.value.keywords = [k for k in expr.value.keywords
                       if k.arg not in ["install_requires", "extras_require"]]
with open('setup.py', 'w') as f:
    f.write(ast.unparse(a))
