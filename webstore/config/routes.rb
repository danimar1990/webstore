Rails.application.routes.draw do
  resources :compras
  resources :clientes
  resources :produtos
  resources :fornecedores
  get 'compras/autocomplete_fornecedor_nome' 
  get 'welcome/index'
  root to: "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
