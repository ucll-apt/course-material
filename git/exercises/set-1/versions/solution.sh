(
    cd sandbox;
    i=1
    for hash in `git log --format=%H --reverse file.txt`; do
        git show $hash:file.txt > file-$i.txt
        ((i=i+1))
    done
)