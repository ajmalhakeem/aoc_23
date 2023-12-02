red = 12 
green = 13
blue = 14

file = File.open('sample_d2.txt')

games = file.readlines.map(&:chomp)

games_hash = {}
games.each do |game| 
    game_id, details = game.split(":", 2)
    game_id = game_id.split(' ')[1].to_i
    games_hash[game_id] = details
end

p games_hash

#{
#    1: [[3,0,3], [1,2,6], [0,0,2]],
 #   2: [[0,2,1],[1,3,4],[0,1,1]],
  #  ...etc
#}

