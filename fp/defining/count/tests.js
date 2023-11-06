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
    const actual = array.count(...args);
    console.log(`Testing [${array.join(", ")}].count(${args.join(", ")})`);

    assert(expected === actual, `Wrong results: expected ${expected}, got ${actual}`);
}


check(0, [], x => x%2 === 0);
check(1, [0], x => x%2 === 0);
check(0, [1], x => x%2 === 0);
check(1, [2], x => x%2 === 0);
check(2, [1,2,3,4], x => x%2 === 0);
check(4, [1,2,3,4], x => x >= 0);
check(4, [1,-5,2,-3,3,4], x => x >= 0);
check(3, [1,-5,2,-3,3,-4], x => x >= 0);


console.log('Success')
