class CreateEstoques < ActiveRecord::Migration[6.0]
  def change
    create_table :estoques do |t|
      t.integer :competencia
      t.decimal :qtde_entrada
      t.decimal :qtde_saida
      t.decimal :qtde_estoque

      t.timestamps
    end
  end
end
