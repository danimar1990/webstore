Rails.application.routes.draw do
  resources :compras
  resources :clientes
  resources :produtos
  resources :fornecedores
  get '/fornecedores' => 'fornecedores#get_nome_fornecedores_by_term', as: 'get_nome_fornecedores_by_term'


  root to: "welcome#index"
end
