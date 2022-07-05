class CreateCompraItens < ActiveRecord::Migration[6.0]
  def change
    create_table :compra_itens do |t|
			t.integer :compra_id
			t.integer :produto_id
      t.decimal :vlr_unitario
      t.decimal :vlr_total
      t.decimal :quantidade

      t.timestamps
    end
  end
end
