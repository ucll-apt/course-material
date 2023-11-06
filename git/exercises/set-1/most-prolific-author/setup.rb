REPO_NAME = 'sandbox'
AUTHORS = [
  'John <john@ucll.be>',
  'John <john@ucll.be>',
  'John <john@ucll.be>',
  'Anna <anna@ucll.be>',
  'Anna <anna@ucll.be>',
  'Morgan <morgan@ucll.be>',
  'Morgan <morgan@ucll.be>',
  'Morgan <morgan@ucll.be>',
  'Morgan <morgan@ucll.be>',
  'Alex <alex@ucll.be>',
  'Alex <alex@ucll.be>',
  'Alex <alex@ucll.be>',
  'Alex <alex@ucll.be>',
  'Alex <alex@ucll.be>',
  'Alex <alex@ucll.be>',
  'Alex <alex@ucll.be>',
  'Joey <joey@ucll.be>',
  'Joey <joey@ucll.be>',
  'Joey <joey@ucll.be>',
  'Joey <joey@ucll.be>',
]

system("git init #{REPO_NAME}")

RND = Random.new 14919

Dir.chdir REPO_NAME do
  (1..100).each do |k|
    filename = "#{k}.txt"
    author = AUTHORS[RND.rand(AUTHORS.size)]
    system('touch', filename)
    system('git', 'add', filename)
    system('git', 'commit', '-m', "added #{filename}", '--author', author)
  end
end
