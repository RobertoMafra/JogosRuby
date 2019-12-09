require_relative 'estoque'

class Livro
  #Atributos
  attr_reader :titulo
  attr_reader :preco
  attr_reader :ano_lancamento
  attr_reader :reimpressao
  attr_reader :editora
  attr_reader :tipo

  #Construtor
  def initialize(titulo, preco, ano_lancamento, reimpressao, editora, tipo)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @reimpressao = reimpressao
    @preco = calcular_preco(preco,reimpressao)
    @editora = editora
    @tipo = tipo
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

