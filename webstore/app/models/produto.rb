class Produto < ApplicationRecord
  validates :nome, presence: true
  validates :preco_venda, numericality: {greater_than: 0}
end
