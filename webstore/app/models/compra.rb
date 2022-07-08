class Compra < ApplicationRecord
	has_many :compra_itens, inverse_of: :compra, dependent: :destroy
	has_many :compras_a_pagar, inverse_of: :compra, dependent: :destroy

	belongs_to :fornecedor
	
  accepts_nested_attributes_for :compra_itens, allow_destroy: true
  accepts_nested_attributes_for :compras_a_pagar, allow_destroy: true
	
  validates :data, :fornecedor_id, :valor_total, presence: true

	def get_competencia
    competencia = "#{self.data.year}#{self.data.month.to_s.rjust(2,'0')}".to_i
  end
end
