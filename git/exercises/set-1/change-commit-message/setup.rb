REPO_NAME = 'sandbox'

system("git init #{REPO_NAME}")

Dir.chdir REPO_NAME do
  system('touch', 'a.txt')
  system('git', 'add', 'a.txt')
  system('git', 'commit', '-m', 'added q.txt')
end
