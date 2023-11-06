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
    const actual = array.maxBy(...args);
    console.log(`Testing [${array.join(", ")}].maxBy(${args.join(", ")})`);

    assert(expected === actual, `Wrong results: expected ${expected}, got ${actual}`);
}


check(0, [0], x => x);
check(5, [5], x => x);
check(5, [5, 1], x => x);
check(6, [5, 1, 6], x => x);
check(6, [-5, 1, 6], x => Math.abs(x));
check(-6, [-5, 1, -6], x => Math.abs(x));
check(-6, [5, 1, -6], x => Math.abs(x));
check("abcd", ["a", "ab", "abc", "abcd"], x => x.length);

console.log('Success')
