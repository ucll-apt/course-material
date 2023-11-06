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
    const actual = array.reject(...args);
    console.log(`Testing [${array.join(", ")}].reject(${args.join(", ")})`);

    assert(expected.length === actual.length, `Wrong number of elements`);

    for ( let i = 0; i !== expected.length; ++i )
    {
        assert(expected[i] === actual[i], `Item at index ${i} is wrong`)
    }
}


check([], [], x => x%2 === 0);
check([1], [1], x => x%2 === 0);
check([1], [1,2], x => x%2 === 0);
check([1,3], [1,2,3], x => x%2 === 0);
check([2], [1,2,3], x => x%2 !== 0);
check(["a"], ["a"], x => x.includes("x"));
check([], ["x"], x => x.includes("x"));
check(["a"], ["a", "x"], x => x.includes("x"));
check(["a"], ["a", "x", "aaaxaaa"], x => x.includes("x"));
check(["x", "aaaxaaa"], ["a", "x", "aaaxaaa"], x => !x.includes("x"));


console.log('Success')
