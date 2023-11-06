require 'fileutils'


CONTAINER_DIRECTORY = 'sandbox'
LOCAL_REPO_NAME = 'local'

FileUtils.mkdir CONTAINER_DIRECTORY

Dir.chdir 'sandbox' do
  system("git init #{LOCAL_REPO_NAME}")

  Dir.chdir LOCAL_REPO_NAME do
    system('touch a.txt')
    system('git add a.txt')
    system('git commit -m "added a.txt"')
  end
end
