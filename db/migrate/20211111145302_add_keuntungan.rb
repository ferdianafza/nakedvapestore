class AddKeuntungan < ActiveRecord::Migration[6.0]
  def change
    add_column :barang_keluars, :keuntungan, :string
  end
end
