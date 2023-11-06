import { createTester } from "./solution";
import { implementedAbs, implementedAdd, implementedConcat, referenceAbs, referenceAdd, referenceConcat } from './shared';


const tester = createTester(referenceConcat, implementedConcat);
tester(1, 1);
