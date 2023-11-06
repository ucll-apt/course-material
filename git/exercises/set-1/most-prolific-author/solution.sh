(
    cd sandbox;
    git log --format=%an | sort | uniq -c | sort -n | tail -n 1 | tr ' ' '\n' | tail -n 1 > prolific.txt
)
