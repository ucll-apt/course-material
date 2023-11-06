import contextlib
import sys
import os
import re


@contextlib.contextmanager
def inside_directory(path):
    current = os.getcwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(current)


def is_negative_test(filename):
    return re.fullmatch(r'should-not-compile-\d+\.ts', filename)


class FailedTest(Exception):
    pass


def abort():
    raise FailedTest()


def compile(filename, should_compile=True):
    print(f'Compiling {filename}...')
    has_compiled = os.system(f'npx tsc --lib ES2020 {filename}') == 0
    if has_compiled != should_compile:
        print('FAILURE')
        abort()


def execute(filename):
    print(f'Running {filename}')
    result = os.system(f'node {filename}')
    if result != 0:
        abort()


def test_exercise(subdirectory):
    with inside_directory(subdirectory):
        compile('tests.ts')
        execute('tests.js')

        for file in (file for file in os.listdir('.') if is_negative_test(file)):
            compile(file, should_compile=False)



results = {}

for path in sys.argv[1:]:
    if os.path.isdir(path) and not 'node_modules' in path:
        try:
            test_exercise(path)
            results[path] = True
        except:
            results[path] = False

print()
print()
print('Summary')
print()

colwidth = max(len(k) for k in results.keys())
for exercise, outcome in results.items():
    print(f'{exercise.rjust(colwidth)} {"PASS" if outcome else "FAIL"}')

if all(results.values()):
    print()
    print('SUCCESS')