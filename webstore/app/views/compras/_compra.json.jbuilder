json.extract! compra, :id, :data, :fornecedor_id, :observacao, :valor_total, :created_at, :updated_at
json.url compra_url(compra, format: :json)
