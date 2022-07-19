class AcsController < ApplicationController
  def autocomplete_fornecedor_nome
    term = params[:term]
    if term && !term.empty?
      items = Fornecedor.where("nome ILIKE ?", "#{term}%").order(:nome).limit(10)
      items += Fornecedor.where("nome ILIKE ? and not nome ilike ?", "%#{term}%","#{term}%").order(:nome).limit(5)
    else
      items = {}
    end
    render :json => Yajl::Encoder.encode(json_for_autocomplete(items, 'nome', []))
  end

  def autocomplete_produto_nome
    term = params[:term]
    if term && !term.empty?
      items = Produto.where("nome ILIKE ?", "#{term}%").order(:nome).limit(10)
      items += Produto.where("nome ILIKE ? and not nome ilike ?", "%#{term}%","#{term}%").order(:nome).limit(5)
    else
      items = {}
    end
    render :json => Yajl::Encoder.encode(json_for_autocomplete(items, 'nome', []))
  end
end
