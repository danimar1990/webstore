class ComprasController < ApplicationController
  before_action :set_compra, only: %i[ show edit update destroy ]

  # GET /compras or /compras.json
  def index
    @compras = Compra.all
  end

  # GET /compras/1 or /compras/1.json
  def show
  end

  # GET /compras/new
  def new
    @compra = Compra.new
		@compra_itens = @compra.compra_itens.build
		#@compras_a_pagar = @compra.compras_a_pagar.build
  end

  # GET /compras/1/edit
  def edit
  end

  # POST /compras or /compras.json
  def create
    @compra = Compra.new(compra_params)

    respond_to do |format|
      if @compra.save
        format.html { redirect_to compra_url(@compra), notice: "Compra criada com sucesso." }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1 or /compras/1.json
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to compra_url(@compra), notice: "Compra atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1 or /compras/1.json
  def destroy
    @compra.destroy

    respond_to do |format|
      format.html { redirect_to compras_url, notice: "Compra excluída com sucesso." }
      format.json { head :no_content }
    end
  end

		def get_compra
			compra = Compra.new
			compra = Compra.find(params[:id]) if params[:id].present?
			compra.attributes = compra_params
			compra.qtde_parcelas = params[:parcelas_a_gerar].to_s.to_i
			compra.nro_dias_parcelas = params[:intervalo_dias].to_s.to_i
			compra
		end

		def gerar_parcelas
			@compra = get_compra
			@compra.gerar_parcelas_compras
		end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compra_params
      params.require(:compra).permit(
				:data, :fornecedor_id, :observacao, :valor_total, 
				compra_itens_attributes: [:id, :compra_id, :produto_id, :vlr_unitario, :vlr_total, :quantidade, :_destroy], 
				compras_a_pagar_attributes: [:id, :compra_id, :nro_parcela, :vlr_parcela, :data_vencto, :_destroy]
			)
    end

		def parametros
			params.permit!
		end
end
