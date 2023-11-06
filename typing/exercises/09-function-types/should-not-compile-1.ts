import { createTester } from "./solution";
import { implementedAbs, implementedAdd, implementedConcat, referenceAbs, referenceAdd, referenceConcat } from './shared';


createTester(referenceConcat, implementedAdd)
