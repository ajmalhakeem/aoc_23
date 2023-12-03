red_max = 12 
green_max = 13
blue_max = 14


file = File.open('d2.txt')

games = file.readlines.map(&:chomp)
playable_games = []

games.each do |game| 
  game_number, sets = game.split(':', 2)
  game_id = game_number.split(' ')[1].to_i

  game_playable = true

  sets.split(';') do |set|
    red_count = set.scan(/\d+ red/).first.to_i
    green_count = set.scan(/\d+ green/).first.to_i
    blue_count = set.scan(/\d+ blue/).first.to_i

    if red_count > red_max || green_count > green_max || blue_count > blue_max
      game_playable = false
      break
    end  
  end

  if game_playable
    playable_games << game_id
  end
end

puts playable_games.sum


