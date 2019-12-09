require_relative 'estoque'

class Livro
  #Atributos
  attr_reader :titulo
  attr_reader :preco
  attr_reader :ano_lancamento
  attr_reader :reimpressao

  #Construtor
  def initialize(titulo, preco, ano_lancamento, reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @reimpressao = reimpressao
    @preco = calcular_preco(preco,reimpressao)
  end

  #Metodos
  def calcular_preco(preco,reimpressao)
    if @ano_lancamento < 2006
      if @reimpressao
        preco * 0.9
      else
        preco * 0.95
      end
    elsif @ano_lancamento <= 2010
        preco * 0.96
    else
        preco
    end
  end

  def to_csv
    puts "#{@titulo}, #{@ano_lancamento}"
  end
end

def imprimir_nota_fiscal(livros)
  livros.each do |livro|
    puts "Titulo: #{livro.titulo} - #{livro.preco}R$"
  end
end

def livro_para_newsletter(livro)
  if @ano_lancamento < 2000
    puts "Nesletter/Liquidação"
    puts @titulo
    puts @preco
  end
end

livro_rails = Livro.new("Agile Web Development with Rails", 70,2011, false )
livro_ruby = Livro.new("Programming Ruby 1.9", 60, 2010, false )
livro_algoritmo = Livro.new("Algoritmos", 100, 1995, true)
livro_arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 100, 1989, false )

estoque = Estoque.new
estoque.adicionar(livro_rails)
estoque.adicionar(livro_ruby)
estoque.adicionar(livro_algoritmo)
estoque.adicionar(livro_arquitetura)
estoque.deletar_livros(livro_algoritmo)

puts "Nota Fical: \n"
imprimir_nota_fiscal(estoque.livros)
puts "\n\nEstoque: \n"
estoque.expostar_csv

puts estoque.livros.maximo

puts"\n\nLivros mais baratos que 80 reais: "
estoque.mais_baratos_que(80)

puts "\n\nNota Fical: \n"
imprimir_nota_fiscal(estoque.livros)