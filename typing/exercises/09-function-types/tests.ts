import { createTester } from "./solution";
import { implementedAbs, implementedAdd, implementedConcat, referenceAbs, referenceAdd, referenceConcat } from './shared';
import { expect } from 'chai';

{
    const tester = createTester(referenceAbs, implementedAbs);

    for ( let i = 1; i !== 10; ++i )
    {
        expect(tester(i)).to.be.true;
        expect(tester(-i)).to.be.false;
    }
}

{
    const tester = createTester(referenceAbs, referenceAbs);

    for ( let i = -10; i !== 10; ++i )
    {
        expect(tester(i)).to.be.true;
    }
}

{
    const tester = createTester(referenceAdd, implementedAdd);

    for ( let i = -10; i !== 10; i++)
    {
        expect(tester(i, 0)).to.be.true;
    }

    for ( let i = -10; i !== 10; i++)
    {
        for ( let j = 1; j !== 10; j++)
        {
            expect(tester(i, j)).to.be.false;
        }
    }
}

{
    const tester = createTester(referenceConcat, implementedConcat);

    expect(tester("", "")).to.be.true;
    expect(tester("a", "")).to.be.true;
    expect(tester("", "a")).to.be.true;
    expect(tester("a", "a")).to.be.true;
    expect(tester("a", "b")).to.be.false;
}
