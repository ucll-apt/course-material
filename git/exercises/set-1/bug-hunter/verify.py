from aptlib import step
import aptlib.steps as steps
import re

culprit = 'sandbox/culprit'

repo = steps.open_git_repository('sandbox')


with step('HEAD must not be detached'):
    assert not repo.head.is_detached

with step('HEAD points to master'):
    assert repo.head.reference.name == 'master'

n = steps.read_file_contents(culprit)

with step('Culprit has been correctly identified'):
    assert int(n.strip()) == 26
