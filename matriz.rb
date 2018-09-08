require 'colorize'

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
      Top to Bottom: #{find_top_to_bottom(word.upcase)}\
      Bottom up: #{find_bottom_to_top(word.upcase)}\
      Diagonal Left Down: #{find_diagonal_left_down(word.upcase)}\
      Diagonal Right Up: #{find_diagonal_right_up(word.upcase)}\
      Diagonal Right Down: #{find_diagonal_right_down(word.upcase)}\
      Diagonal Left Up: #{find_diagonal_left_up(word.upcase)}."
      puts str.gsub(/ {6}/, ' | ')
    end

    display
  end

  def hl(coord, direction, size)
    case direction
    when :horizontal
      size.times do |n|
        @matrix_body[coord[0]][coord[1] + n] =
            @matrix_body[coord[0]][coord[1] + n].to_s.blue
      end
    when :vertical
      size.times do |n|
        @matrix_body[coord[0] + n][coord[1]] =
            @matrix_body[coord[0] + n][coord[1]].to_s.yellow
      end
    when :diagonal
      size.times do |n|
        @matrix_body[coord[0] + n][coord[1] + n] =
            @matrix_body[coord[0] + n][coord[1] + n].to_s.red
      end
    end
  end

  def find_left_to_right(word)
    @rows.times do |n|
      indice = @matrix_body[n].join.index(word)
      hl([n, indice],:horizontal, word.size) if indice
      return {row: n + 1, column: indice + 1 } if indice
    end
    nil
  end

  def find_right_to_left(word)
    r = find_left_to_right(word.reverse)
    r[:column] += word.size - 1 if r.is_a? Hash
    r
  end

  def find_top_to_bottom(word)
    list_of_first_letter_coord = find_first_letter_vertical(word)
    found = []
    list_of_first_letter_coord.each do |a|
      letras = 0
      word.size.times do |n|
        letras += 1 if word[n] == @matrix_body[a[0]+n][a[1]].to_s
      end
      found << a if letras == word.size
      hl(a,:vertical, word.size) if letras == word.size
    end
    format_hash(found)
  end

  def find_bottom_to_top(word)
    r = find_top_to_bottom(word.reverse)
    return if r.empty?
    r.each do |h|
      h[:row] += word.size - 1
    end
    r
  end

  def find_diagonal_left_down(word)
    list_of_first_letter_coord = find_first_letter_vertical(word)
    found = []
    list_of_first_letter_coord.each do |a|
      letras = 0
      word.size.times do |n|
        letras += 1 if word[n] == @matrix_body[a[0]+n][a[1]+n].to_s
      end
      found << a if letras == word.size
      hl(a,:diagonal, word.size) if letras == word.size
    end
    format_hash(found)
  end

  def find_diagonal_right_up(word)
    r = find_diagonal_left_down(word.reverse)
    return if r.empty?
    r.each do |h|
      h[:row] += word.size - 1
      h[:column] += word.size - 1
    end
    r
  end

  def find_diagonal_right_down(word)
    list_of_first_letter_coord = find_first_letter_vertical(word)
    found = []
    list_of_first_letter_coord.each do |a|
      letras = 0
      word.size.times do
        |n| letras += 1 if word[n] == @matrix_body[a[0]+n][a[1]-n].to_s
      end
      found << a if letras == word.size
    end
    format_hash(found)
  end

  def find_diagonal_left_up(word)
    r = find_diagonal_right_down(word.reverse)
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