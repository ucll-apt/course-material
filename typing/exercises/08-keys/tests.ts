import { assert, Equals } from 'tsafe';
import { setting } from './solution';


{
    const x = setting('path');
    type TX = typeof x;
    assert<Equals<TX, string>>();
}

{
    const x = setting('minimum');
    type TX = typeof x;
    assert<Equals<TX, number>>();
}

{
    const x = setting('verbose');
    type TX = typeof x;
    assert<Equals<TX, boolean>>();
}
