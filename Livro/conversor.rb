class Conversor
  def string_para_alfanumerico(nome)
    nome.gsub /[^\w\s]/,''
  end
end
