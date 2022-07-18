class Utilitarios::ParcelarService
	attr_accessor :errors
	attr_accessor :qtde_parcelas, :intervalos_dias, :valor_total
	attr_accessor :parcelas

	def initialize(qtde_parcelas, intervalos_dias, valor_total)
		self.errors = ActiveModel::Errors.new(self)
		self.qtde_parcelas = qtde_parcelas
		self.intervalos_dias = intervalos_dias
		self.valor_total = valor_total.to_s.to_d
		self.parcelas = []
	end

  def is_valid?
		if self.qtde_parcelas > 12
			self.errors.add(:base, "A quantida de parcelas não deve ser maior que 12.")
		end

		if self.valor_total > 999999
			self.errors.add(:base, "O valor total da compra excede o valor máximo de R$ 999.999,00.")
		end
	
		if self.intervalos_dias > 120
			self.errors.add(:base, "O intervalo de dias entre parcelas não deve exceder 120 dias.")
		end
	
		self.errors.blank?
	end

	def calcular_valor_parcelas
		parcela = (self.valor_total / self.qtde_parcelas)
		parcela = parcela.round(2)
	end

	def gerar
		if is_valid?
			if self.qtde_parcelas.present? && self.intervalos_dias.present?
				data_hoje = Date.today
				(1..self.qtde_parcelas).each do |parcela|
					data_hoje += self.intervalos_dias.day
					self.parcelas << OpenStruct.new(
						nro_parcela: parcela,
						data_vencto: data_hoje,
						vlr_parcela: self.calcular_valor_parcelas
					)
				end
			end
		end
		self.ajustar_centavos_arredondamento
		self.parcelas
	end

	def ajustar_centavos_arredondamento
		return if self.parcelas.blank?
		
		total_parcelas = self.parcelas.sum(&:vlr_parcela)

		
		if total_parcelas != self.valor_total
			self.parcelas[0].vlr_parcela = self.parcelas[0].vlr_parcela + (self.valor_total - total_parcelas)
		end
	end
end