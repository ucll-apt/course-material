const settings = {
    path: 'c:/',
    minimum: 1,
    verbose: true
}

type Settings = typeof settings;

export function setting<K extends keyof Settings>(key : K) : Settings[K]
{
    return settings[key];
}
