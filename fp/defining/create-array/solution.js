module.exports.createArray = function (size, initializer)
{
    const result = new Array(size);

    for ( let i = 0; i !== result.length; ++i )
    {
        result[i] = initializer(i);
    }

    return result;
}