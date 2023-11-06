const { partition } = require('./solution.js');

function assert(condition, message)
{
    if ( !condition )
    {
        console.error(message);
        process.exit(-1);
    }
}


function check(expected, array, ...args)
{
    const actual = array.takeWhile(...args);
    console.log(`Testing [${array.join(", ")}].takeWhile(${args.join(", ")})`);

    assert(expected.length === actual.length, `Wrong number of elements`);

    for ( let i = 0; i !== expected.length; ++i )
    {
        assert(expected[i] === actual[i], `Item at index ${i} is wrong`)
    }
}


check([], [], x => x > 0);
check([1], [1], x => x > 0);
check([1,2], [1,2], x => x > 0);
check([1,2,3], [1,2,3], x => x > 0);
check([], [-1,2,3], x => x > 0);
check([1], [1,-2,3], x => x > 0);
check([1,2], [1,2,-3], x => x > 0);
check([2,4,6], [2,4,6,5,4], x => x%2 === 0);
check([], [1,2,4,6,5,4], x => x%2 === 0);


console.log('Success')
