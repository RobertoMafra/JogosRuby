class Estoque
  attr_reader :livros
  def initialize
    @livros = []
  end

  def expostar_csv
    @livros.each do |livro|
      puts "#{livro.titulo}, #{livro.ano_lancamento}"
    end
  end
end


