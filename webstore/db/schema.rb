# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_01_182031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf_cnpj"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "compra_itens", force: :cascade do |t|
    t.integer "compra_id"
    t.integer "produto_id"
    t.decimal "vlr_unitario"
    t.decimal "vlr_total"
    t.decimal "quantidade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "compras", force: :cascade do |t|
    t.date "data"
    t.bigint "fornecedor_id", null: false
    t.text "observacao"
    t.decimal "valor_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fornecedor_id"], name: "index_compras_on_fornecedor_id"
  end

  create_table "estoques", force: :cascade do |t|
    t.integer "competencia"
    t.decimal "qtde_entrada"
    t.decimal "qtde_saida"
    t.decimal "qtde_estoque"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string "nome"
    t.string "cpf_cnpj"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco_venda"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venda_itens", force: :cascade do |t|
    t.integer "compra_id"
    t.integer "produto_id"
    t.decimal "vlr_unitario"
    t.decimal "vlr_total"
    t.decimal "quantidade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "compras", "fornecedores"
end
