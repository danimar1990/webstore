class Estoque < ApplicationRecord
	before_save :extrai_competencia

	def extrai_competencia
		Date.parse(self.competencia).strftime("%m%Y")
	end

end
