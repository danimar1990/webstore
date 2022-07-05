class CompraItem < ApplicationRecord
	belongs_to :compra, inverse_of: :compra_itens

	before_save :calcular_valor_unitario

	validates :compra_id, :produto_id, :vlr_unitario, :vlr_total, presence: true

	def calcular_valor_unitario
		self.vlr_unitario = self.vlr_total / self.quantidade
	end
end
