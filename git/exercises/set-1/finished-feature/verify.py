from aptlib import step, count_commits
import aptlib.steps as steps
import git


local_repo = steps.open_git_repository('sandbox/local')
remote_repo = steps.open_git_repository('sandbox/remote')

with step('Local repo contains one branch'):
    refs = [ref for ref in local_repo.references if not isinstance(ref, git.RemoteReference)]
    assert len(refs) == 1

with step("Local repo's sole branch is called master"):
    assert local_repo.references[0].name == 'master'

with step("Local repo's master branch must have four commits"):
    assert count_commits(local_repo.head.commit) == 4

with step('Remote repo contains one branch'):
    assert len(remote_repo.references) == 1

with step("Remote repo's sole branch is called master"):
    assert remote_repo.references[0].name == 'master'

with step("Remote repo's master branch must have four commits"):
    assert count_commits(remote_repo.head.commit) == 4
