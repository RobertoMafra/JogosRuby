def boas_vindas
  puts "Bem vido ao jogo da adivinhação!"
  puts "Digite o seu nome:"
  nome = gets.strip
  puts "Estamos pronto para jogar, #{nome}"
end

def escolher_dificuldade
  puts "\n"
  puts "Escolha o nível do jogo:"
  puts "(1) Muito Fácil (2) Fácil (3) Médio (4) Difícil (5) Muito Difícil)"

  nivel = gets.to_i
end

def sortear_numero(dificuldade)
  case dificuldade
  when 1
    maior_valor = 30
  when 2
    maior_valor = 60
  when 3
    maior_valor = 100
  when 4
    maior_valor = 150
  else
    maior_valor = 200
  end

  puts "\nEscolhendo um número secreto entre 1 e #{maior_valor}"
  numero_secreto = rand (maior_valor) + 1
  puts "Número escolhido. Bora adivinha o número?"

  #retorno não precisa de return
  numero_secreto
end

def receber_numero(numeros_tentados, tentativa, total_tentativas)
  puts "Tentativa #{tentativa} de #{total_tentativas}"
  puts "Numeros tentados: #{numeros_tentados}"
  puts "Entre com seu número:"
  numero_usuario = gets.strip
  puts "\n\n"
  puts "Será que você acertou? O número escolhido por você foi: #{numero_usuario}"

  numero_usuario.to_i
end

def verificar_acerto(numero_secreto, numero_usuario)
  acertou = numero_secreto == numero_usuario

  if acertou
    puts "Você acertou!"
    return true
  end

  maior = numero_secreto > numero_usuario
  if maior
    puts "O número secreto é maior do que o escolhido!"
  else
    puts "O número secreto é menor do que o escolhido!"
  end
  puts "\n\n"

  false
end

def jogar (nome, dificuldade)
  numero_secreto = sortear_numero(dificuldade)
  total_tentativas = 5
  puts "\n\n"

  tentativa = 1
  numeros_tentados = []
  pontuacao = 1000

  while tentativa <= total_tentativas

    numero_usuario = receber_numero(numeros_tentados, tentativa, total_tentativas)
    numeros_tentados << numero_usuario

    pontos_perdidos = (numero_usuario - numero_secreto).abs / 2.0
    pontuacao = pontuacao - pontos_perdidos

    if verificar_acerto(numero_secreto, numero_usuario)
      break ;
    end

    tentativa = tentativa + 1
  end

  puts "Voce ganhou #{pontuacao}!"
end

def quer_jogar
  puts "Deseja jogar novamente: (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "S"
end

nome = boas_vindas
dificuldade = escolher_dificuldade
jogar_novamente = true

loop do
  jogar(nome,dificuldade)
  unless quer_jogar?
    break
  end
end