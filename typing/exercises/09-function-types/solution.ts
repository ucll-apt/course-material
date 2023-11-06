export function createTester<R, Ps extends any[]>(referenceFunction : (...args : Ps) => R, testedFunction : (...args : Ps) => R) : (...args : Ps) => boolean
{
    return (...args : Ps) : boolean =>
    {
        const actual = testedFunction(...args);
        const expected = referenceFunction(...args);

        return actual === expected;
    };
}
