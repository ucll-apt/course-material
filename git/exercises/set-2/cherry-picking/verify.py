from aptlib import step, count_commits
import aptlib.steps as steps
import os
import re


repo = steps.open_git_repository('sandbox')

with step('Active branch should be master'):
    assert repo.active_branch.name == 'master'

data = steps.read_file_contents('sandbox/b17.txt')

with step('File b17.txt must have right contents'):
    assert int(data.strip()) == 17**2

data = steps.read_file_contents('sandbox/b19.txt')

with step('File b19.txt must have right contents'):
    assert int(data.strip()) == 19**2

with step('Branch master must contain 4 commits'):
    assert count_commits(repo.active_branch.commit) == 4
