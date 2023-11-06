const { partial } = require('./solution.js');

function assert(condition, message)
{
    if ( !condition )
    {
        console.error(message);
        process.exit(-1);
    }
}


function check(f, input)
{
    const bound = partial(f, input[0]);
    const actual = bound(...input.slice(1));
    const expected = f(...input);
    console.log(`Testing partial(${f}, ${input[0]})`);

    assert(expected === actual, 'Wrong result');
}


check((x, y) => x + y, [1, 2]);
check((x, y) => x + y, ['pre', 'fix']);
check((x, y, z) => x + y + z, [1, 2, 3]);
check((...xs) => xs.reduce((x, y) => x * y, 1), [1, 2, 3]);
check((...xs) => xs.reduce((x, y) => x * y, 1), [1, 2, 3, 4]);
check((...xs) => xs.reduce((x, y) => x * y, 1), [1, 2, 3, 4, 5]);
check((x, y, z) => x ? y : z, [true, 1, 2]);
check((x, y, z) => x ? y : z, [false, 1, 2]);

console.log('Success')
