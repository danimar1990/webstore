Rails.application.routes.draw do
  resources :compras
  resources :clientes
  resources :produtos
  resources :fornecedores
  resources :acs do
    collection do
			get :autocomplete_fornecedor_nome
    end
  end
	
  root to: "welcome#index"
end
