(
    cd sandbox/local;
    git merge feature;
    git push;
    git branch -d feature;
    git push origin --delete feature
)