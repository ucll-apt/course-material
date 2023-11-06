REPO_NAME = 'sandbox'

system("git init #{REPO_NAME}")

Dir.chdir REPO_NAME do
  IO.write('innocent.txt', 'tralala')
  system('git', 'add', 'innocent.txt')
  system('git', 'commit', '-m', 'added innocent.txt')

  IO.write('password.txt', 'azer1234')
  system('git', 'add', 'password.txt')
  system('git', 'commit', '-m', 'added password.txt')
end
