class CreateComprasAPagar < ActiveRecord::Migration[6.0]
  def change
    create_table :compras_a_pagar do |t|
      t.integer :compra_id
      t.integer :nro_parcela
      t.decimal :vlr_parcela
      t.date :data_vencto

      t.timestamps
    end
  end
end
