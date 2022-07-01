class Compra < ApplicationRecord
  belongs_to :fornecedor
  validates :data, :fornecedor_id, :valor_total, presence: true
end
