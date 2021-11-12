class CreateBarangKeluars < ActiveRecord::Migration[6.0]
  def change
    create_table :barang_keluars do |t|
      t.integer :stok_id
      t.integer :qty

      t.timestamps
    end
  end
end
