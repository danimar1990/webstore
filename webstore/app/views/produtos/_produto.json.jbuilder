json.extract! produto, :id, :nome, :preco_venda, :created_at, :updated_at
json.url produto_url(produto, format: :json)
