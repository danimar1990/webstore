class CompraAPagar < ApplicationRecord
	belongs_to :compra, inverse_of: :compras_a_pagar

	before_save :calcular_valor_parcela

	def calcular_valor_parcela
		self.vlr_parcela = (compra.valor_total / self.nro_parcela)
	end
end
