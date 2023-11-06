from aptlib import step
import aptlib.steps as steps
import os
import re


repo = steps.open_git_repository('sandbox')


with step('last commit should have message "added b.txt"'):
    assert repo.active_branch.commit.message.strip() == "added b.txt"

with step('penultimate commit should have message "added a.txt"'):
    assert repo.active_branch.commit.parents[0].message.strip() == "added a.txt"

with step('last commit should have only one parent'):
    assert len(repo.active_branch.commit.parents) == 1

with step('master should contain only two commits'):
    assert repo.active_branch.commit.parents[0].parents == ()

with step('b.txt should exist in staging area'):
    assert any(name == 'b.txt' for name, _ in repo.index.entries.keys())

with step('b.txt should exist in working area'):
    path = os.path.join(repo.working_tree_dir, 'b.txt')
    assert os.path.isfile(path)
