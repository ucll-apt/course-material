import { expect } from 'chai';
import { duration } from './solution';


expect(duration(["test", [1, 0], [1, 30]])).to.be.eql(30);
expect(duration(["test", [1, 0], [2, 0]])).to.be.eql(60);
expect(duration(["test", [12, 0], [15, 0]])).to.be.eql(180);
