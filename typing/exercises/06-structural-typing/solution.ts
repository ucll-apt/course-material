export function checkUniqueness(xs : {id: number}[]) : boolean
{
    const ids = new Set<number>();

    for ( const { id } of xs )
    {
        if ( ids.has(id) )
        {
            return false;
        }
        else
        {
            ids.add(id);
        }
    }

    return true;
}
