def salvar_rank(nome, pontos_totais)
  jogador = "#{nome}\n#{pontos_totais}"
  File.write("rank.txt", jogador)
end

def ler_rank
  conteudo = File.read("rank.txt")
  conteudo.split("\n")
end
