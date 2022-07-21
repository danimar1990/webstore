class CompraItem < ApplicationRecord
	belongs_to :compra, inverse_of: :compra_itens
	belongs_to :produto

	#before_save :calcular_estoque

	def calcular_estoque
		#estoque = Estoque.where(... .first)
	end

	def calcular_valor_total
		self.vlr_total = self.quantidade * self.vlr_unitario
	end
end
