class Heroi
  attr_accessor :linha
  attr_accessor :coluna

  attr_reader

  def movimentar_heroi(direcao)
    heroi = self.dup

    movimentos = {
        "W"=> [-1,0],
        "S"=> [+1,0],
        "A"=> [0,-1],
        "D"=> [0,+1]
    }
    movimento = movimentos[direcao]
    heroi.linha += movimento[0]
    heroi.coluna += movimento[1]

    heroi
  end

  def to_array
    [linha,coluna]
  end

  def remover_do_mapa(mapa)
    mapa[linha][coluna] = " "
  end

  def colocar_no_mapa(mapa)
    mapa[linha][coluna] = "H"
  end

  def direita
    movimentar_heroi("D")
  end

  def esquerda
    movimentar_heroi("A")
  end
  
  def cima
    movimentar_heroi("W")
  end

  def baixo
    movimentar_heroi("S")
  end

end
