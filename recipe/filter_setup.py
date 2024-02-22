lines = []
with open('pyproject.toml', 'r', encoding='utf-8') as f:
    for line in f:
        if '"protobuf' in line:
            continue
        if '"rx' in line:
            continue
        lines.append(line)

with open('pyproject.toml', 'w', encoding='utf-8') as f:
    for line in lines:
        f.write(line)
