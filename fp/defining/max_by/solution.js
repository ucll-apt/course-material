Array.prototype.maxBy = function(keyFunction) {
    let result = this[0];

    for ( let i = 1; i < this.length; ++i )
    {
        const current = this[i];

        if ( keyFunction(result) < keyFunction(current) )
        {
            result = current;
        }
    }

    return result;
}
