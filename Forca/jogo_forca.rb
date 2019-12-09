require_relative '../rb'
require_relative 'rank'

def escolher_palavra_secreta
  avisa_escolhendo_palavra
  texto = File.read("dicionario.txt").split("\n")
  numero_aleatorio = rand(texto.size)
  palavra_secreta = texto[numero_aleatorio].downcase

  avisa_palavra_escolhida(palavra_secreta)

  palavra_secreta
end

def palavra_secreta_pouca_memoria
  arquivo = File.new("dicionario.txt")
  quantidade_palavraas = arquivo.gets.to_i
  numero_aleatorio = rand(quantidade_palavraas)
  for linha in 1..(numero_aleatorio - 1)
    arquivo.gets
  end

  palavra_secreta = arquivo.gets.strip.downcase
  arquivo.close

  avisa_palavra_escolhida(palavra_secreta)
  palavra_secreta
end

def receber_chute_valido (chutes, erros)
  loop do
    chute = tentativa(erros, chutes).downcase

    if chutes.include? chute
      chute_ja_tentado(chute)
    else
      return chute
    end
  end
end

def palavra_mascarada(palavra_secreta, chutes)
  palavra = ""
  for letra in palavra_secreta.chars
    if chutes.include? letra
      palavra << letra
    else
      palavra << "_"
    end
  end

  palavra
end

def jogar(nome)
  palavra_secreta = palavra_secreta_pouca_memoria
  erros = 0
  chutes = []
  pontos_somados = 0

  while erros < 5
    mascarada = palavra_mascarada(palavra_secreta, chutes)
    contador = 0
    cabecalho_tentativa(chutes, erros, mascarada)
    chute = receber_chute_valido(chutes, erros)

    chutes << chute

    chutou_uma_letra = chute.size == 1

    if chutou_uma_letra
      contador = palavra_secreta.count(chute)

      if contador == 0
        avisa_letra_nao_encontrada
        erros = erros + 1
      else
        avisa_letra_encontrada(contador)
      end
    else
      acertou = chute == palavra_secreta
      if acertou
        avisa_acerto_de_palavra
        pontos_somados = pontos_somados + 100
        break
      else
        avisa_erro_de_palavra
        erros = erros + 1
        pontos_somados = pontos_somados - 30
      end
    end
  end
  avisa_pontos_somado(pontos_somados)

  pontos_somados
end

def jogo_da_forca
  nome = boas_vindas
  pontos_totais = 0

  avisa_campeao_atual(ler_rank)

  loop do

    pontos_totais = pontos_totais + jogar(nome)
    avisa_pontos_totais(pontos_totais)
    unless jogar_novamente
      break
    end
  end
  if ler_rank[1].to_i < pontos_totais
    salvar_rank(nome, pontos_totais)
  end
end
