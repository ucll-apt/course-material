import { exactlyEqual } from './solution';
import { expect } from 'chai';


expect(exactlyEqual({}, {})).to.be.true;
expect(exactlyEqual({a: 1}, {a: 1})).to.be.true;
expect(exactlyEqual({a: 1}, {a: 2})).to.be.false;
expect(exactlyEqual({a: true}, {a: false})).to.be.false;
expect(exactlyEqual({x: 1, y: 2, z: 3}, {x: 1, y: 2, z: 3})).to.be.true;
expect(exactlyEqual({x: 1, y: 2, z: 3}, {x: 1, y: 2, z: 4})).to.be.false;
