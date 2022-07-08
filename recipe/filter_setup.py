lines = []
with open('setup.py') as f:
    for line in f:
        if "zaber_motion_bindings" in line:
            continue
        if "protobuf" in line:
            continue
        if "rx" in line:
            continue
        lines.append(line)

with open('setup.py', 'w') as f:
    for line in lines:
        f.write(line)
