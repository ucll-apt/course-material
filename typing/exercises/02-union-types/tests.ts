import { expect } from 'chai';
import { remove } from './solution';


expect(remove([1], 1)).to.be.deep.equal([]);
expect(remove([1, 2], 1)).to.be.deep.equal([2]);
expect(remove([1, 2], 3)).to.be.deep.equal([1, 2]);
expect(remove([1, 2, 3, 4, 5, 6, 7, 8, 9], 7)).to.be.deep.equal([1, 2, 3, 4, 5, 6, 8, 9]);
