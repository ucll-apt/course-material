export function duration([_, [sh, sm], [eh, em]]: [string, [number, number], [number, number]]) : number
{
    return (eh * 60 + em) - (sh * 60 - sm);
}
