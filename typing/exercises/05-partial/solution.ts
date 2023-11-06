export function fillDefaults<T>(obj : Partial<T>, defaults : Required<T>) : Required<T>
{
    return { ...defaults, ...obj };
}
