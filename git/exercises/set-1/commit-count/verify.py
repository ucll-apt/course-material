from aptlib import step
import aptlib.steps as steps
import re

count = 'sandbox/count'

repo = steps.open_git_repository('sandbox')


n = steps.read_file_contents(count)

with step(f"File {count} must contain number of commits"):
    assert int(n.strip()) == 53
