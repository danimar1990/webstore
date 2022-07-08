class CompraItem < ApplicationRecord
	belongs_to :compra, inverse_of: :compra_itens
	belongs_to :produto

	# before_save :calcular_valor_total

	def calcular_valor_total
		self.vlr_total = self.quantidade * self.vlr_unitario
	end
end
