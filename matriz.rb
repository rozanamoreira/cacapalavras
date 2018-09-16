require 'colorize'
require 'pry'

class Matriz
  def initialize(m,n)
    @rows,  = m
    @columns = n
    @matrix_body = Array.new(m) {Array.new(n) { (:A..:Z).to_a.sample } }
  end
  def display
    @rows.times do |l|
      @columns.times do |c|
        print @matrix_body[l][c]
        print " "
      end
      print "\n"
    end
  end

  def find_all(words)
    words.each do |word|
      str = "#{word} >>> \
      Left to Right: #{find_left_to_right(word.upcase)}\
      Right to Left: #{find_right_to_left(word.upcase)}\
      Top to Bottom: #{find(word.upcase,:vertical)}\
      Bottom up: #{find_bottom_to_top(word.upcase)}\
      Diagonal Left Down: #{find(word.upcase, :diagonal_left)}\
      Diagonal Right Up: #{find_diagonal_right_up(word.upcase)}\
      Diagonal Right Down: #{find(word.upcase, :diagonal_right)}\
      Diagonal Left Up: #{find_diagonal_left_up(word.upcase)}."
      puts str.gsub(/ {6}/, ' | ')
    end

    display
  end

  def hl(coord, direction, size)
    size.times do |n|
      case direction
      when :horizontal
        @matrix_body[coord[0]][coord[1] + n] =
            @matrix_body[coord[0]][coord[1] + n].to_s.blue
      when :vertical
        @matrix_body[coord[0] + n][coord[1]] =
            @matrix_body[coord[0] + n][coord[1]].to_s.yellow
      when :diagonal_left
        @matrix_body[coord[0] + n][coord[1] + n] =
            @matrix_body[coord[0] + n][coord[1] + n].to_s.red
      when :diagonal_right
        @matrix_body[coord[0] + n][coord[1] - n] =
            @matrix_body[coord[0] + n][coord[1] - n].to_s.green
      end
    end
  end

  def find_left_to_right(word)
    found = []
    @rows.times do |n|
      next_start = 0
      loop do
        indice = @matrix_body[n].join.index(word, next_start)
        if indice
          next_start = indice + word.size
          hl([n, indice],:horizontal, word.size)
          found << {row: n + 1, column: indice + 1 }
        end
        break if indice.nil?
      end
    end
    found.empty? ? nil : found
  end

  def find_right_to_left(word)
    r = find_left_to_right(word.reverse)
    r[:column] += word.size - 1 if r.is_a? Hash
    r
  end

  def find(word, direction)
    list_of_first_letter_coord = find_first_letter_vertical(word)
    found = []
    list_of_first_letter_coord.each do |a|
      letras = 0
      word.size.times do |n|
        case direction
        when :vertical
          letras += 1 if word[n] == @matrix_body[a[0]+n][a[1]].to_s
        when :diagonal_left
          letras += 1 if word[n] == @matrix_body[a[0]+n][a[1]+n].to_s
        when :diagonal_right
          letras += 1 if word[n] == @matrix_body[a[0]+n][a[1]-n].to_s
        end
        found << a if letras == word.size
        hl(a, direction, word.size) if letras == word.size
      end
    end
    format_hash(found)
  end

  def find_bottom_to_top(word)
    r = find(word.reverse,:vertical)
    return if r.empty?
    r.each { |h| h[:row] += word.size - 1 }
    r
  end

  def find_diagonal_right_up(word)
    r = find(word.reverse, :diagonal_left)
    return if r.empty?
    r.each do |h|
      h[:row] += word.size - 1
      h[:column] += word.size - 1
    end
    r
  end

  def find_diagonal_left_up(word)
    r = find(word.reverse, :diagonal_right)
    return if r.empty?
    r.each do |h|
      h[:row] += word.size - 1
      h[:column] -= word.size - 1
    end
    r
  end

  private

  def find_first_letter_vertical(word)
    list = []
    0.upto(@rows - word.size) do |n|
      i = @matrix_body[n].join.index(word[0])
      list << [n,i] if i
    end
    list
  end

  def format_hash(array)
    coordinates = []
    array.each do |a|
      h = {}
      h[:row] = a[0] + 1
      h[:column] = a[1] + 1
      coordinates << h
    end
    coordinates
  end
end