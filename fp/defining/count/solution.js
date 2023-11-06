Array.prototype.count = function(predicate) {
    let result = 0;

    for ( const x of this )
    {
        if ( predicate(x) )
        {
            result++;
        }
    }

    return result;
}
