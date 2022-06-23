class CreateCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :compras do |t|
      t.date :data
      t.references :fornecedor, null: false, foreign_key: true
      t.text :observacao
      t.decimal :valor_total

      t.timestamps
    end
  end
end
