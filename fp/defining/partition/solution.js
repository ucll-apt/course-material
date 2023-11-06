Array.prototype.partition = function(predicate) {
    const trues = [];
    const falses = [];

    for ( const x of this )
    {
        if ( predicate(x) )
        {
            trues.push(x);
        }
        else
        {
            falses.push(x);
        }
    }

    return [ trues, falses ];
}
