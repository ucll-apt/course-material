from aptlib import step
import aptlib.steps as steps
import os
import re


repo = steps.open_git_repository('sandbox')


with step('Last commit should have message "added innocent.txt"'):
    assert repo.active_branch.commit.message.strip() == "added innocent.txt"

with step('Branch master should only have one commit'):
    assert repo.active_branch.commit.parents == ()

with step('File password.txt should not exist in staging area'):
    assert not any(name == 'password.txt' for name, _ in repo.index.entries.keys())

with step('File password.txt should not exist in working area'):
    path = os.path.join(repo.working_tree_dir, 'password.txt')
    assert not os.path.isfile(path)

with step('Reflog should not contain references to deleted commit'):
    log = repo.active_branch.log()
    assert not any(re.search('password.txt', entry.message) for entry in log)
