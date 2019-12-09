require_relative 'ui'
require_relative 'heroi'

def ler_mapa(numero)
  arquivo = "mapa#{numero}.txt"
  texto = File.read(arquivo)
  mapa = texto.split("\n")
end

def encontrar_jogador(mapa)
  heroi = "H"

  mapa.each_with_index do |linha_atual, linha|
    coluna = linha_atual.index(heroi)
    if coluna != nil
      jogador = Heroi.new
      jogador.linha = linha
      jogador.coluna = coluna
      return jogador
    end
  end
  nil
end

def validar_posicao?(mapa, nova_posicao)
  linhas = mapa.size
  colunas = mapa[0].size

  estourou_linha = nova_posicao[0] < 0 || nova_posicao[0] >= linhas
  estourou_coluna = nova_posicao[1] < 0 || nova_posicao[1] >= colunas

  if estourou_linha || estourou_coluna
    return false
  end

  valor_atual = mapa[nova_posicao[0]][nova_posicao[1]]
  if valor_atual == "X" || valor_atual == "F"
    return false
  end

  true
end

def mover_fantasma(mapa, novo_mapa, linha, coluna)
  posicoes = posicao_valida_a_partir_de(mapa, novo_mapa, [linha,coluna])

  if posicoes.empty?
    return
  end
  numero_aleatorio = rand(posicoes.size)
  posicao_aleatoria = posicoes[numero_aleatorio]
  mapa[linha][coluna] = " "
  novo_mapa[posicao_aleatoria[0]][posicao_aleatoria[1]] = "F"
end

def copiar_mapa(mapa)
  novo_mapa = mapa.join("\n").tr("F", " ").split("\n")
end

def mover_fantasmas(mapa)

  fantasma = "F"
  novo_mapa = copiar_mapa(mapa)
  mapa.each_with_index do |linha_atual, linha|
    linha_atual.chars.each_with_index do |caracter_atual, coluna|
      eh_fantasma = caracter_atual == fantasma
      if eh_fantasma
        mover_fantasma(mapa,novo_mapa,linha,coluna)
      end
    end
  end
  novo_mapa
end

def soma_vetor(vetor1, vetor2)
  [vetor1[0] + vetor2[0], vetor1[1] + vetor2[1]]
end

def posicao_valida_a_partir_de(mapa,novo_mapa, posicao)
  posicoes = []
  movimentos = [[+1,0], [-1,0], [0,+1], [0,-1]]
  movimentos.each do |movimento|
    nova_posicao = soma_vetor(movimento,posicao)
    if validar_posicao?(mapa,nova_posicao) && validar_posicao?(novo_mapa,nova_posicao)
      posicoes << nova_posicao
    end
  end
  posicoes
end

def perdeu_o_jogo?(mapa)
  perdeu = !encontrar_jogador(mapa)
end

def pegar_bomba(mapa, posicao, quantidade)
  if quantidade == 0
    return
  end
  executar_remocao(mapa, posicao.direita, quantidade)
  executar_remocao(mapa, posicao.esquerda, quantidade)
  executar_remocao(mapa, posicao.cima, quantidade)
  executar_remocao(mapa, posicao.baixo, quantidade)
end

def executar_remocao(mapa, posicao, quantidade)
  if mapa[posicao.linha][posicao.coluna] == nil || mapa[posicao.linha][posicao.coluna] == "X"
    return
  end
  posicao.remover_do_mapa(mapa)
  pegar_bomba(mapa,posicao,quantidade - 1)
end

def jogar(nome)
  mapa = ler_mapa(3)

  while true
    desenhar_mapa(mapa)
    direcao = pedir_movimento
    heroi = encontrar_jogador(mapa)
    heroi_nova_posicao = heroi.movimentar_heroi(direcao)

    if !validar_posicao?(mapa,heroi_nova_posicao.to_array)
      next
    end
    heroi.remover_do_mapa(mapa)

    if mapa[heroi_nova_posicao.linha][heroi_nova_posicao.coluna] == "*"
      pegar_bomba(mapa,heroi_nova_posicao, 4)
    end


    heroi_nova_posicao.colocar_no_mapa(mapa)
    mapa = mover_fantasmas(mapa)

    if perdeu_o_jogo?(mapa)
      game_over
      break
    end
  end
end

def iniciar_fogefoge
  nome = boas_vindas
  jogar(nome)
end