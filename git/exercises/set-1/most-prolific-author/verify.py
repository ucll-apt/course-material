from aptlib import step
import aptlib.steps as steps
import os
import re


repo = steps.open_git_repository('sandbox')
filename = 'prolific.txt'


with step('File prolific.txt should exist in working area'):
    path = os.path.join(repo.working_tree_dir, 'prolific.txt')
    assert os.path.isfile(path)

with step('File prolific.txt should contain "Alex"'):
    path = os.path.join(repo.working_tree_dir, 'prolific.txt')
    with open(path) as f:
        assert f.read().strip() == 'Alex'
