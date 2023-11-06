type SudokuNumber = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9


export function remove(ns : SudokuNumber[], n : SudokuNumber) : SudokuNumber[]
{
    return ns.filter(x => x !== n);
}
