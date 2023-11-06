Array.prototype.takeWhile = function(predicate) {
    const result = [];

    for ( const x of this )
    {
        if ( predicate(x) )
        {
            result.push(x);
        }
        else
        {
            return result;
        }
    }

    return result;
}
