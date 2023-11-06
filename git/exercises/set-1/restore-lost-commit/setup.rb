REPO_NAME = 'sandbox'

system("git init #{REPO_NAME}")

Dir.chdir REPO_NAME do
  IO.write('a.txt', 'tralala')
  system('git', 'add', 'a.txt')
  system('git', 'commit', '-m', 'added a.txt')

  IO.write('b.txt', 'tralala')
  system('git', 'add', 'b.txt')
  system('git', 'commit', '-m', 'added b.txt')

  system('git', 'reset', '--hard', 'HEAD~1')
end
