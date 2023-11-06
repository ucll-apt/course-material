const { createArray } = require('./solution.js');


function assert(condition, message)
{
    if ( !condition )
    {
        console.error(message);
        process.exit(-1);
    }
}


function check(expected, ...args)
{
    const actual = createArray(...args);
    console.log(`Testing createArray(${args.join(", ")})`);

    assert(expected.length === actual.length, `Wrong length`)

    for ( let i = 0; i !== expected.length; ++i )
    {
        assert(expected[i] === actual[i], `Item at index ${i} is wrong`)
    }
}


check([], 0, i => i);
check([0], 1, i => i);
check([0, 1, 2, 3, 4], 5, i => i);
check([0], 1, i => i**2);
check([0, 1, 4, 9, 16], 5, i => i**2);
check([0, 1, 4, 9, 16], 5, i => i**2);
check([true, false, true, false, true, false], 6, i => i%2 === 0);

console.log('Success')
