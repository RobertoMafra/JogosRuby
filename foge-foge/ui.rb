def boas_vindas
  puts "Bem vindo ao jogo Foge-Foge"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def desenhar_mapa(mapa)
  puts mapa
end

def pedir_movimento
  puts("Para onde seja ir?")
  movimento = gets.strip.upcase
end

def game_over
  puts "\n\nGAME OVER!"
end
