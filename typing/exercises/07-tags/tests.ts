import { expect } from 'chai';
import { area } from './solution';


expect(area({tag: 'circle', radius: 1})).to.be.approximately(Math.PI, 0.1);
expect(area({tag: 'circle', radius: 2})).to.be.approximately(Math.PI * 4, 0.1);
expect(area({tag: 'square', side: 1})).to.be.approximately(1, 0.1);
expect(area({tag: 'square', side: 2})).to.be.approximately(4, 0.1);
