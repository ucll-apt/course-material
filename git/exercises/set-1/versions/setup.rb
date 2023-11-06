REPO_NAME = 'sandbox'


system("git init #{REPO_NAME}")

RANDOM = Random.new 41901
NCOMMITS = 10
FILENAME = 'file.txt'
OTHER_FILENAMES = [ 'foo.txt', 'bar.txt', 'baz.txt', 'qux.txt' ]

Dir.chdir REPO_NAME do
  (1..NCOMMITS).each do |k|
    contents = <<~END
    #{k}
    END
    IO.write(FILENAME, contents)
    system('git', 'add', FILENAME)
    system('git', 'commit', '-m', "updated #{FILENAME}")

    (1..RANDOM.rand(5)).each do
      contents = RANDOM.rand(10000).to_s
      filename = OTHER_FILENAMES[RANDOM.rand(OTHER_FILENAMES.size)]
      IO.write(filename, contents)
      system('git', 'add', filename)
      system('git', 'commit', '-m', "updated #{filename}")
    end
  end
end
