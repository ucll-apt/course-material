import { fillDefaults } from './solution';


const result = fillDefaults<{ a ?: number }>({a: 1}, {});
