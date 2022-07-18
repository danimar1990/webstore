class CompraAPagar < ApplicationRecord
	belongs_to :compra, inverse_of: :compras_a_pagar
end
