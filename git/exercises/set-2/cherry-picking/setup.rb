REPO_NAME = 'sandbox'

system("git init #{REPO_NAME}")

Dir.chdir REPO_NAME do
  IO.write('a.txt', 'a')
  system('git', 'add', 'a.txt')
  system('git', 'commit', '-m', 'added a.txt')

  IO.write('a.txt', 'aa')
  system('git', 'add', 'a.txt')
  system('git', 'commit', '-m', 'updated a.txt')

  system('git', 'checkout', '-b', 'feature')

  (1..20).each do |k|
    filename = "b#{k}.txt"
    contents = "#{k ** 2}"
    IO.write(filename, contents)
    system('git', 'add', filename)
    system('git', 'commit', '-m', "updated #{filename}")
  end

  system('git', 'checkout', 'master')
end
