(
    cd sandbox;
    git reset --hard HEAD~1;
    git reflog expire --expire-unreachable=now --all
)
