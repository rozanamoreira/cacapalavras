require './matriz.rb'
x, y = ARGV

m = Matriz.new(x.to_i,y.to_i)

puts 'Type filename'

fn = STDIN.gets.chomp

if fn.empty?
  puts 'No File given. Using Sample.'
  fn = 'sample.txt'
elsif !File.exists?(fn)
  puts 'File doesn\'t exists. Using sample instead.'
  fn = 'sample.txt'
end

list_of_countries = File.read(fn).gsub(/ |\"/,'').split ','


m.find_all(list_of_countries)




