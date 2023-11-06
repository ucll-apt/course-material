type Exact<T, Expected> = T extends Expected ? Exclude<keyof T, keyof Expected> extends never ? T : never : never;


export function exactlyEqual<T1, T2>(x : Exact<T1, T2>, y : T2) : boolean
{
    for ( const key of Object.keys(x) )
    {
        if ( x[key] != y[key] )
        {
            return false;
        }
    }

    return true;
}
