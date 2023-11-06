import { expect } from 'chai';
import { fillDefaults } from './solution';
import { assert, Equals } from 'tsafe';


expect(fillDefaults<{x: number}>({}, {x: 5})).to.be.eql({x: 5});
expect(fillDefaults<{x: number}>({x: 1}, {x: 5})).to.be.eql({x: 1});
expect(fillDefaults<{x: number, y: boolean}>({x: 1}, {x: 5, y: false})).to.be.eql({x: 1, y: false});
expect(fillDefaults<{x: number, y: boolean}>({y: true}, {x: 5, y: false})).to.be.eql({x: 5, y: true});
expect(fillDefaults<{a: string, b : string}>({a: 'xyz'}, {a: 'abc', b: 'abc'})).to.be.eql({a: 'xyz', b: 'abc'});
expect(fillDefaults<{a: string, b : string}>({b: 'xyz'}, {a: 'abc', b: 'abc'})).to.be.eql({a: 'abc', b: 'xyz'});

{
    type Data = { a ?: number };
    type Expected = { a : number };

    const result = fillDefaults<Data>({}, {a: 2});

    assert<Equals<typeof result, Expected>>();
}