module Contador
  attr_reader :maximo

  def <<(livro)
    push(livro)
    if @maximo.nil? || @maximo < size
      @maximo = size
    end
    self
  end
end

