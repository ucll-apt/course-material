const { partition } = require('./solution.js');

function assert(condition, message)
{
    if ( !condition )
    {
        console.error(message);
        process.exit(-1);
    }
}


function check(expectedLeft, expectedRight, array, ...args)
{
    const [ actualLeft, actualRight ] = array.partition(...args);
    console.log(`Testing [${array.join(", ")}].partition(${args.join(", ")})`);

    assert(expectedLeft.length === actualLeft.length, "Left array has wrong length");
    assert(expectedRight.length === actualRight.length, "Right array has wrong length");

    for ( let i = 0; i !== expectedLeft.length; ++i )
    {
        assert(expectedLeft[i] === actualLeft[i], `left[${i}] is wrong`)
    }

    for ( let i = 0; i !== expectedRight.length; ++i )
    {
        assert(expectedRight[i] === actualRight[i], `right[${i}] is wrong`)
    }
}


check([], [], [], x => x % 2 === 0);
check([2, 4], [1, 3], [1, 2, 3, 4], x => x % 2 === 0);
check([1, 3], [2, 4], [1, 2, 3, 4], x => x % 2 !== 0);
check([7,5,6,9], [1,4,3,2], [7,1,5,4,3,2,6,9], x => x > 4);

console.log('Success')
