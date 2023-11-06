Array.prototype.groupBy = function(keyFunction) {
    const result = new Map();

    for ( const x of this )
    {
        const key = keyFunction(x);

        if ( !result.has(key)  )
        {
            result.set(key, []);
        }

        result.get(key).push(x);
    }

    return result;
}
