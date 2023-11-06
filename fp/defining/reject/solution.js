Array.prototype.reject = function(predicate) {
    const result = [];

    for ( const x of this )
    {
        if ( !predicate(x) )
        {
            result.push(x);
        }
    }

    return result;
}
