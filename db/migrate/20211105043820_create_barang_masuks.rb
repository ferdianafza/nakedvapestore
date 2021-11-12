class CreateBarangMasuks < ActiveRecord::Migration[6.0]
  def change
    create_table :barang_masuks do |t|
      t.string :stok_id
      t.integer :qty

      t.timestamps
    end
  end
end
