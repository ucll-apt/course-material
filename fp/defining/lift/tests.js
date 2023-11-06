const { lift } = require('./solution.js');

function assert(condition, message)
{
    if ( !condition )
    {
        console.error(message);
        process.exit(-1);
    }
}


function check(expected, input, f)
{
    const lifted = lift(f);
    const actual = lifted(input);
    console.log(`Testing lift(${f})`);

    assert(expected.length === actual.length, `Wrong number of elements`);

    for ( let i = 0; i !== expected.length; ++i )
    {
        assert(expected[i] === actual[i], `Item at index ${i} is wrong`)
    }
}


check([], [], x => x);
check([0], [0], x => x);
check([0], [0], x => x*2);
check([0,2,4], [0,1,2], x => x*2);
check([0,1,4], [0,1,2], x => x**2);

console.log('Success')
