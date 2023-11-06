const { partition } = require('./solution.js');

function buildMap()
{
    const map = new Map();
    const obj = {};

    obj.add = (x, y) => { map.set(x, y); return obj; }
    obj.end = () => map;

    return obj;
}

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
    const actual = array.groupBy(...args);
    // console.log(actual);
    // console.log(expected);
    console.log(`Testing [${array.join(", ")}].groupBy(${args.join(", ")})`);

    assert([...expected.keys()].length === [...actual.keys()].length, "Wrong number of key/value pairs");

    for ( const key of expected.keys() )
    {
        assert(actual.has(key), `Missing key ${key}`);

        const expectedValues = expected.get(key);
        const actualValues = actual.get(key);

        // console.log(expectedValues);
        // console.log(actualValues);

        assert(expectedValues.length === actualValues.length, `Unequal number of values for key ${key}`);

        for ( let i = 0; i !== expectedValues.length; ++i )
        {
            const expectedValue = expectedValues[i];
            const actualValue = actualValues[i];

            assert(expectedValue === actualValue, `Wrong value with index ${i} for key ${key}`);
        }
    }
}

check(
    buildMap()
    .end(), [], x => x%5);

check(
    buildMap()
    .add(0, [0])
    .end(), [0], x => x%5);


check(
    buildMap()
    .add(0, [''])
    .add(1, ['x', 'y'])
    .add(2, ['xy'])
    .end(), ['', 'x', 'y', 'xy'], x => x.length);

check(
    buildMap()
    .add(0, [0,5,10,15])
    .add(1, [1,6,11])
    .add(2, [2,7,12])
    .add(3, [3,8,13])
    .add(4, [4,9,14])
    .end(), [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], x => x%5);

console.log('Success')
