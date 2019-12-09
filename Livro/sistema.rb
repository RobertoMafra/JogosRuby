require_relative 'livro'


livro_rails = Livro.new("Agile Web Development with Rails", 70,2011, false, "Editora Agata", "livro" )
livro_ruby = Livro.new("Programming Ruby 1.9", 60, 2010, false,"Editora Agata", "livro" )
livro_algoritmo = Livro.new("Algoritmos", 100, 1995, true, "Editora Agata", "livro")
livro_arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 100, 1989, false, "Editora Agata", "livro")
revistona = Livro.new("Revista de ruby", 10,2012,true, "", "revista" )
online_aquitetura = Livro.new("Introdução a arquitetura e design de software", 50,2012,true, "", "ebook" )

estoque = Estoque.new
estoque.adicionar(livro_rails)
estoque.adicionar(livro_ruby)
estoque.adicionar(livro_algoritmo)
estoque.adicionar(livro_algoritmo)
estoque.adicionar(livro_arquitetura)
estoque.adicionar(livro_ruby)
estoque.adicionar(livro_ruby)
estoque.adicionar(revistona)
estoque.adicionar(revistona)
estoque.adicionar(online_aquitetura)

estoque.vender(livro_ruby)
estoque.vender(livro_ruby)
estoque.vender(livro_ruby)
estoque.vender(livro_algoritmo)
estoque.vender(livro_algoritmo)
estoque.vender(revistona)
estoque.vendas(online_aquitetura)

puts "Livro mais vendido: "
puts estoque.livro_que_mais_vendeu_por(&:titulo)

puts "\n\nRevista mais vendida: "
puts estoque.revista_que_mais_vendeu_por(&:titulo)

puts "\n\nEbook mais vendida: "
puts estoque.Ebook_que_mais_vendeu_por(&:titulo)

puts "\n\nNota Fical: \n"
imprimir_nota_fiscal(estoque.livros)
puts "\n\nEstoque: \n"
estoque.expostar_csv

puts estoque.livros.maximo

puts"\n\nLivros mais baratos que 80 reais: "
estoque.mais_baratos_que(80)

puts "\n\nNota Fical: \n"
imprimir_nota_fiscal(estoque.livros)
