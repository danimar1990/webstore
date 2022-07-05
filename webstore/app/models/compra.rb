class Compra < ApplicationRecord
	has_many :compra_itens, inverse_of: :compra, dependent: :destroy

  accepts_nested_attributes_for :compra_itens, reject_if: :all_blank, allow_destroy: true

  belongs_to :fornecedor

  validates :data, :fornecedor_id, :valor_total, presence: true

	def get_competencia
    competencia = "#{self.data.year}#{self.data.month.to_s.rjust(2,'0')}".to_i
  end
end
