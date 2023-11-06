import { expect } from 'chai';
import { fillDefaults } from './solution';


expect(fillDefaults({x: 5, b: true, s: 'xyz'})).to.be.deep.equal({x: 5, b: true, s: 'xyz'});
expect(fillDefaults({})).to.be.deep.equal({x: 5, b: true, s: 'xyz'});
expect(fillDefaults({x: 1})).to.be.deep.equal({x: 1, b: true, s: 'xyz'});
expect(fillDefaults({x: 1, b: false})).to.be.deep.equal({x: 1, b: false, s: 'xyz'});
expect(fillDefaults({s: ''})).to.be.deep.equal({x: 5, b: true, s: ''});
