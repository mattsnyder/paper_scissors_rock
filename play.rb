require './game'

match_game_count = 1000
if ARGV.size > 2 and ARGV[0] == "-m" and ARGV[1] =~ /^[1-9]\d*$/
  ARGV.shift
  match_game_count = ARGV.shift.to_i
end

ARGV.each do |p|
  if test(?d, p)
    Dir.foreach(p) do |file|
      next if file =~ /^\./
      next unless file =~ /\.rb$/
      require File.join(p, file)
    end
  else
    require p
  end
end

Player.each_pair do |one, two|
  game = Game.new one, two
  game.play match_game_count
  puts game.results
end
