(
    cd sandbox;
    git bisect start HEAD `git log --format=%H | tail -n 1`;
    git bisect run grep CORRECT file.txt;
    X1=`git bisect log | tail -n 1`;
    X2=${X1#*[}
    COMMIT=${X2%]*};
    echo commit: $COMMIT;
    git show $COMMIT:file.txt | tail -n 1 > culprit;
    git bisect reset
)
