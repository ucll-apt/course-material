export function fillDefaults({ x = 5, b = true, s = 'xyz' } : { x ?: number, b ?: boolean, s ?: string }) : { x : number, b : boolean, s : string }
{
    return { x, b, s };
}
