from aptlib import step
import aptlib.steps as steps
import os


local_repo = steps.open_git_repository('sandbox/local')

with step('Directory sandbox/remote exists'):
    assert os.path.isdir('sandbox/remote')

remote_repo = steps.open_git_repository('sandbox/remote')

with step('Remote repo contains one branch'):
    assert len(remote_repo.references) == 1

with step("Remote repo's sole branch is called master"):
    assert remote_repo.references[0].name == 'master'

with step("Remote repo's master has one commit"):
    assert remote_repo.references[0].commit.parents == ()

with step("Branch master in local repo is tracking origin/master"):
    assert local_repo.references.master.tracking_branch().name == 'origin/master'
