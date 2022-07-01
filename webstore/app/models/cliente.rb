class Cliente < ApplicationRecord
  validates :nome, :cpf_cnpj, presence: true
  validates :cpf_cnpj, uniqueness: true
end
