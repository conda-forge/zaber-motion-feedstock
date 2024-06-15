lines = []
with open('pyproject.toml', 'r', encoding='utf-8') as f:
    for line in f:
        # They pin very hard....
        # just lets follow the pinning in conda
        if 'reactivex' in line:
            continue
        lines.append(line)

with open('pyproject.toml', 'w', encoding='utf-8') as f:
    for line in lines:
        f.write(line)
