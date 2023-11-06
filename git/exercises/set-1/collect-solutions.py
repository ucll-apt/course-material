from zipfile import ZipFile
import sys
import os


zipfile_name = 'submission.zip'
n_exercises = 10



if os.path.isfile(zipfile_name):
    print(f'Found an existing {zipfile_name}')
    print('I feel uncomfortable overwriting it')
    print('Please get rid of it first and then run this script again')
    sys.exit(-1)


directories = [directory for directory in os.listdir('.') if os.path.isdir(directory)]

if len(directories) != n_exercises:
    print(f"Expected to find {n_exercises} subdirectories, only found {len(directories)} :-(")
    print(f"Aborting!")
    sys.exit(-1)

print(f'Found {len(directories)} directories as expected')


solution_files = [os.path.join(directory, 'solution.sh') for directory in directories]

print(f"Creating {zipfile_name}")
with ZipFile(zipfile_name, 'w') as zf:
    for solution_file in solution_files:
        print(f'Adding {solution_file} to {zipfile_name}')
        zf.write(solution_file)

if len(solution_files) != n_exercises:
    print(f"Warning: only {len(solution_files)} solution files were added to {zipfile_name}!")
    print(f"There are {n_exercises} in total")
    print(f"I'm assuming you've skipped {n_exercises - len(solution_files)} exercises")

print(f"Please double check {zipfile_name}")
print(f"If you are confident everything is in order, you should upload {zipfile_name} to Toledo")