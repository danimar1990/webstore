class Cliente < ApplicationRecord
  validates_presence_of :nome
  validates_presence_of :cpf_cnpj

  validates_uniqueness_of :cpf_cnpj
end
