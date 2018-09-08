require './matriz.rb'

x, y = ARGV

m = Matriz.new(x.to_i,y.to_i)

m.display

puts 'What do you want to find?'

w = STDIN.gets.chomp.upcase

puts "Left to Right: #{m.find_left_to_right(w)}"
puts "Right to Left: #{m.find_right_to_left(w)}"
puts "Top to Bottom: #{m.find_top_to_bottom(w)}"
puts "Bottom up: #{m.find_bottom_to_top(w)}"
puts "Diagonal Left Down: #{m.find_diagonal_left_down(w)}"
puts "Diagonal Right Up: #{m.find_diagonal_right_up(w)}"
puts "Diagonal Right Down: #{m.find_diagonal_right_down(w)}"
puts "Diagonal Left Up: #{m.find_diagonal_left_up(w)}"




