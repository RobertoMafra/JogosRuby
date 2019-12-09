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

def mais_baratos_que(valor, estoque)
  livros = []
  estoque.each do |livro|
    if livro.preco <= valor
      puts "#{livro.titulo}, #{livro.ano_lancamento} - preço: R$ #{livro.preco}"
    end
  end
end

livro_rails = Livro.new("Agile Web Development with Rails", 70,2011, false )
livro_ruby = Livro.new("Programming Ruby 1.9", 60, 2010, false )
livro_algoritmo = Livro.new("Algoritmos", 100, 1995, true)
livro_arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 100, 1989, false )

estoque = Estoque.new
estoque.livros << livro_rails
estoque.livros << livro_ruby
estoque.livros << livro_algoritmo
estoque.livros << livro_arquitetura

puts "Nota Fical: \n"
imprimir_nota_fiscal(estoque.livros)
puts "\n\nEstoque: \n"
estoque.expostar_csv

puts"\n\nLivros mais baratos que 80 reais: "
mais_baratos_que(80, estoque.livros)