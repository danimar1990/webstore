class Produto < ApplicationRecord
  validates_presence_of :nome
  validates_numericality_of :preco_venda, greater_than: 0
end
