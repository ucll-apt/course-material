from aptlib import step
import aptlib.steps as steps
import re


repo = steps.open_git_repository('sandbox')


with step('Branch master should have 2 log entries in reflog'):
    assert len(repo.heads.master.log()) == 2

with step('Branch master reflog should mention amend'):
    last_reflog_entry = repo.heads.master.log()[-1]
    assert re.search(r'\(amend\)', last_reflog_entry.message)

with step('Last commit should have message "added a.txt"'):
    assert repo.active_branch.commit.message.strip() == "added a.txt"

with step('Branch master should only have one commit'):
    assert repo.active_branch.commit.parents == ()
