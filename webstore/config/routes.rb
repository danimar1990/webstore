Rails.application.routes.draw do
  resources :clientes
  resources :produtos
  resources :fornecedores
  resources :acs do
    collection do
			get :autocomplete_fornecedor_nome
			get :autocomplete_produto_nome
    end
  end

  resources :compras do
    collection do
      put :gerar_parcelas
		end
  end
	
  root to: "welcome#index"
end
