class CreateVendaItens < ActiveRecord::Migration[6.0]
  def change
    create_table :venda_itens do |t|
      t.decimal :vlr_unitario
      t.decimal :vlr_total
      t.decimal :quantidade

      t.timestamps
    end
  end
end
