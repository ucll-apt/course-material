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
    const actual = array.bundle(...args);
    console.log(`Testing [${array.join(", ")}].bundle(${args.join(", ")})`);

    assert(expected.length === actual.length, `Wrong number of bundles`);

    for ( let i = 0; i !== expected.length; ++i )
    {
        const expectedBundle = expected[i];
        const actualBundle = actual[i];

        assert(expectedBundle.length === actualBundle.length, `Bundle with index ${i} has wrong number of elements`);

        for ( let j = 0; j !== expectedBundle.length; ++j )
        {
            const e = expectedBundle[j];
            const a = actualBundle[j];

            assert(e === a, `Element #${j} in bundle #${i} is wrong`);
        }
    }
}


check([], [], x => x%2);
check([[1]], [1], x => x%2);
check([[1,3]], [1,3], x => x%2);
check([[1,3], [2,4]], [1,3,2,4], x => x%2);
check([[1,3], [2,4], [7], [8]], [1,3,2,4,7,8], x => x%2);
check([], [], x => x.length);
check([["a"]], ["a"], x => x.length);
check([["a", "b"]], ["a", "b"], x => x.length);
check([["a", "b"], ["ab"]], ["a", "b", "ab"], x => x.length);
check([["a", "b"], ["ab"], ["x"]], ["a", "b", "ab", "x"], x => x.length);

console.log('Success')
