import { checkUniqueness } from "./solution";
import { expect } from 'chai';


expect(checkUniqueness([])).to.be.true;
expect(checkUniqueness([{id: 5}])).to.be.true;
expect(checkUniqueness([{id: 5}, {id: 6}])).to.be.true;
expect(checkUniqueness([{id: 5}, {id: 5}])).to.be.false;

{
    const x = {id: 5, x: false};
    const y = {id: 7, a: 'abc'};
    expect(checkUniqueness([x, y])).to.be.true;
}

{
    const x = {id: 5, x: false};
    const y = {id: 5, a: 'abc'};
    expect(checkUniqueness([x, y])).to.be.false;
}
