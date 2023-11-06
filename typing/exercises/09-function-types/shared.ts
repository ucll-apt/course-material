export function referenceAbs(n : number) : number
{
    return n < 0 ? -n : n;
}

export function implementedAbs(n : number) : number
{
    return n;
}

export function referenceAdd(a : number, b : number) : number
{
    return a + b;
}

export function implementedAdd(a : number, b : number) : number
{
    return a - b;
}

export function referenceConcat(a : string, b : string) : string
{
    return a + b;
}

export function implementedConcat(a : string, b : string) : string
{
    return b + a;
}