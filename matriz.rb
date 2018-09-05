class Matriz
 attr_reader :matriz
  def initialize(m,n)
    @linhas = m
    @colunas = n
    @matriz = Array.new(m) {Array.new(n) { (:A..:Z).to_a.sample } }

  end
  def display
    @linhas.times do |l|
      @colunas.times do |c|
        print @matriz[l][c]
        print " "
      end
      print "\n"
    end
  end

 def find(word)

 end

  # def highlight(word,index)
  #   size = word.size
  #   @matriz[index..size-1].downcase!
  # end


  def find_left_to_right(word)

    @linhas.times do |n|
      indice = @matriz[n].join.index(word)
      return {linha: n + 1, coluna: indice + 1 } if indice
    end
  end

 def find_right_to_left(word)
   @linhas.times do |n|
     indice = @matriz[n].join.index(word.reverse)
     return {linha: n + 1 , coluna: indice + 1 + word.size } if indice
   end
 end

end