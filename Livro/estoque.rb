require_relative 'contador'

class Estoque
  attr_reader :livros
  def initialize
    @livros = []
    @livros.extend Contador
  end

  def total_livros
    @livros.size
  end

  def expostar_csv
    @livros.each do |livro|
      livro.to_csv
    end
  end

  def mais_baratos_que(valor)
    @livros.each do |livro|
      if livro.preco <= valor
        puts "#{livro.titulo}, #{livro.ano_lancamento} - preço: R$ #{livro.preco.round(2)}"
      end
    end
  end

  def adicionar(livro)
    if livro != nil?
      @livros << livro
    end
  end

  def deletar_livros(livro)
    @livros.delete(livro)
  end

  def maximo
    @livros.maximo
  end
end


