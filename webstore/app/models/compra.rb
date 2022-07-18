class Compra < ApplicationRecord
	attr_accessor :qtde_parcelas, :nro_dias_parcelas
	has_many :compra_itens, inverse_of: :compra, dependent: :destroy
	has_many :compras_a_pagar, inverse_of: :compra, dependent: :destroy

	belongs_to :fornecedor

	accepts_nested_attributes_for :compra_itens, allow_destroy: true
	accepts_nested_attributes_for :compras_a_pagar, allow_destroy: true
	
	validates :data, :fornecedor_id, :valor_total, presence: true
	
	validate :validar_totais

	before_save :gerar_parcelas_compras, :validar_totais

	def validar_totais
		valor_parcelas = self.calcular_total_parcelas

		if self.valor_total != valor_parcelas
			self.errors.add(:base, "A soma dos valores das parcelas (R$ #{valor_parcelas}) deve ser igual ao valor total da nota (R$ #{valor_total}).")
		end
		self.errors.blank?
	end

	def calcular_total_parcelas
		total_parcelas = 0.0
		self.compras_a_pagar.each do |parcela|
			total_parcelas += parcela.vlr_parcela
		end
		total_parcelas
	end

	def gerar_parcelas_compras
		parcelar_service = Utilitarios::ParcelarService.new(self.qtde_parcelas, self.nro_dias_parcelas, self.valor_total)
		parcelar_service.gerar
		parcelar_service.parcelas.each do |parcela|
			self.compras_a_pagar.build(
				nro_parcela: parcela.nro_parcela,
				data_vencto: parcela.data_vencto,
				vlr_parcela: parcela.vlr_parcela
			)
		end
	end

	def get_competencia
		competencia = "#{self.data.year}#{self.data.month.to_s.rjust(2,'0')}".to_i
	end
end
