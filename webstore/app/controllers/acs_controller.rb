# encoding=utf-8
class AcsController < ApplicationController

  def autocomplete_fornecedor_nome
    term = params[:term]
    if term && !term.empty?
      nomes = Fornecedor.where("nome ILIKE ?", "#{term}%").order(:nome).limit(10)
      Fornecedor.where("nome ILIKE ? and not nome ilike ?", "%#{term}%","#{term}%").order(:nome).limit(5).each do |parcial|
        nomes << parcial
      end
    else
      nomes = {}
    end
    render :json => Yajl::Encoder.encode(json_for_autocomplete(nomes, 'nome', []))
  end

end
