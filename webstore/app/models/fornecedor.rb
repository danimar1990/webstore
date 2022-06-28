class Fornecedor < ApplicationRecord
  validates_presence_of :nome
  validates_presence_of :cpf_cnpj
  validates_uniqueness_of :cpf_cnpj

  def self.search(term) 
	where("nome ILIKE ?", "%#{term}%") 
  end
end
