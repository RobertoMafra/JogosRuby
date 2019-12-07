def boas_vindas
  puts "Bem vindo ao jogo da Forca"
  puts "Qual o seu nome?"
  nome = gets.strip
  puts "\n\n"
  puts "Estamos prontos para jogar, #{nome}"
  nome
end

def cabecalho_tentativa(letras_tentadas, erros, mascara)
  puts "\nErros ate agora #{erros}"
  puts "Palavra secreta: #{mascara}"
  puts "Letras já utilizadas: #{letras_tentadas}\n"
  puts "Entre com uma letra ou palavra: "
end

def tentativa (erros, letras_tentadas)

  chute = gets.strip.downcase
  puts "\nSerá que você acertou? Você escolheu #{chute}\n"

  chute
end

def testar_chute(letra, chutes)
  teste = false

  for posicao in 0..chutes
    if(chutes[posicao] == letra)
      teste = true
    end
  end

  teste
end

def chute_ja_tentado(chute)
  puts "Você ja chutou a letra #{chute}"
end

def avisa_letra_nao_encontrada
  puts "Letra não encontrada!"
end

def avisa_letra_encontrada(contador)
  puts "Letra encontrada #{contador} vezes"
end

def avisa_acerto_de_palavra
  puts "Parabéns, você acertou!"
end

def avisa_erro_de_palavra
  puts "Você errou!"
end

def avisa_pontos_somado(pontos)
  puts "Você ganhou #{pontos} até agora"
end

def jogar_novamente
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "S"
end

def avisa_escolhendo_palavra
  puts "Escolhendo uma palavra secreta..."
end

def avisa_palavra_escolhida(palavra_secreta)
  puts "Palavra secreta escolhida com #{palavra_secreta.length} letras. Boa sorte!\n\n"
end

def avisa_pontos_totais (pontos_totais)
  puts "Você possui #{pontos_totais} pontos"
end

def avisa_campeao_atual(dados)
  puts "Nosso atual campeao é #{dados[0]} com #{dados[1]} pontos"
end
