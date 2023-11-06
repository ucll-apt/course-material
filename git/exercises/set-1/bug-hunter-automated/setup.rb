REPO_NAME = 'sandbox'


system("git init #{REPO_NAME}")

NCOMMITS = 100
FILENAME = 'file.txt'

Dir.chdir REPO_NAME do
  (1..NCOMMITS).each do |k|
    header = k < NCOMMITS / 4 - 1 ? 'CORRECT' : 'BUG'
    contents = <<~END
    #{header}
    #{k}
    END
    IO.write(FILENAME, contents)
    system('git', 'add', FILENAME)
    system('git', 'commit', '-m', "updated #{FILENAME}")
  end
end
