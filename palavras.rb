require './matriz.rb'

puts "Please type two numbers to form the Matrix"
# x = gets.chomp
# y = gets.chomp

x = 50
y = 50
m = Matriz.new(x.to_i,y.to_i)

m.display

puts "What do you want to find?"

w = gets.chomp

m.find_diagonal_left_down(w)



