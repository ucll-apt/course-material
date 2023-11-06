require 'fileutils'


CONTAINER_DIRECTORY = 'sandbox'
LOCAL_REPO_NAME = 'local'
REMOTE_REPO_NAME = 'remote'

FileUtils.mkdir CONTAINER_DIRECTORY

Dir.chdir 'sandbox' do
  system("git init #{LOCAL_REPO_NAME}")
  system("git init --bare #{REMOTE_REPO_NAME}")

  Dir.chdir LOCAL_REPO_NAME do
    system('git remote add origin ../remote')

    system('touch a.txt')
    system('git add a.txt')
    system('git commit -m "added a.txt"')

    system('touch b.txt')
    system('git add b.txt')
    system('git commit -m "added b.txt"')

    system('git push -u origin master')

    system('git checkout -b feature')

    system('touch c.txt')
    system('git add c.txt')
    system('git commit -m "added c.txt"')

    system('touch d.txt')
    system('git add d.txt')
    system('git commit -m "added d.txt"')
    system('git push -u origin feature')

    system('git checkout master')
  end
end
