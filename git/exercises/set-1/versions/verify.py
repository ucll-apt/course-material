from aptlib import step
import aptlib.steps as steps
import re

repo = steps.open_git_repository('sandbox')


for i in range(1, 11):
    filename = f"sandbox/file-{i}.txt"
    data = steps.read_file_contents(filename)

    with step(f'File {filename} has the correct contents'):
        assert int(data) == i
