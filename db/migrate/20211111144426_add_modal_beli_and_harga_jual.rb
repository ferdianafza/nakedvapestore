class AddModalBeliAndHargaJual < ActiveRecord::Migration[6.0]
  def change
    add_column :stoks, :modal_beli, :string
    add_column :stoks, :harga_jual, :string
  end
end
