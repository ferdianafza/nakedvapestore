class CreateStoks < ActiveRecord::Migration[6.0]
  def change
    create_table :stoks do |t|
      t.string :nama_produk
      t.integer :qty

      t.timestamps
    end
  end
end
