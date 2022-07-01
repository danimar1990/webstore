class VendaItem < ApplicationRecord
	before_save :calcular_valor_unitario

	def calcular_valor_unitario
		self.vlr_unitario = self.vlr_total / self.quantidade
	end
end
