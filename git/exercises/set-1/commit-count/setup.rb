REPO_NAME = 'sandbox'


system("git init #{REPO_NAME}")

RANDOM = Random.new 413131
NCOMMITS = 53
FILENAME = 'file.txt'

Dir.chdir REPO_NAME do
  (1..NCOMMITS).each do |k|
    contents = RANDOM.rand(100000)
    IO.write(FILENAME, contents)
    system('git', 'add', FILENAME)
    system('git', 'commit', '-m', "updated #{FILENAME}")
  end
end
