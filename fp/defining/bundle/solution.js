Array.prototype.bundle = function(keyFunction) {
    if ( this.length === 0 )
    {
        return [];
    }

    const result = [[this[0]]];

    for ( let i = 1; i < this.length; ++i )
    {
        const lastBundle = result[result.length - 1];
        const current = this[i];
        const k1 = keyFunction(lastBundle[0]);
        const k2 = keyFunction(current);

        if ( k1 === k2 )
        {
            lastBundle.push(current);
        }
        else
        {
            result.push([current]);
        }
    }

    return result;
}
