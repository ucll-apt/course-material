(
    cd sandbox;
    git init --bare remote;
    cd local;
    git remote add origin ../remote;
    git push -u origin master
)