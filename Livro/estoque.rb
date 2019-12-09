require_relative 'modulos'

class Estoque
  attr_reader :livros
  attr_reader :vendas
  def initialize
    @livros = []
    @vendas = []
    @livros.extend Modulos
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

  def vender(livro)
    @livros.delete livro
    @vendas << livro
  end

  def quantidade_de_vendas_por(produto, &campo)
    @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
  end

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select { | l | l.tipo == tipo}.sort {|v1,v2|
      quantidade_de_vendas_por(v1, &:titulo) <=> quantidade_de_vendas_por(v2, &:titulo)}.last
  end

  def livro_que_mais_vendeu_por(&campo)
    que_mais_vendeu_por("livro", &campo)
  end

  def revista_que_mais_vendeu_por(&campo)
    que_mais_vendeu_por("revista", &campo)
  end

  def maximo
    @livros.maximo
  end
end


