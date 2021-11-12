class AddTanggal < ActiveRecord::Migration[6.0]
  def change
    add_column :barang_keluars, :tanggal, :string
  end
end
