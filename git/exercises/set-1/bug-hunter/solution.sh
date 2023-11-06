(
    cd sandbox;
    git bisect start;
    git bisect bad;
    git bisect good `git log --format=%h | tail -n 1`;
    git bisect bad;
    git bisect good;
    git bisect bad;
    git bisect bad;
    git bisect bad;
    git bisect bad;
    git bisect bad;
    tail -n 1 file.txt > culprit;
    git bisect reset
)