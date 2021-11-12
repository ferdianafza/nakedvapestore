json.extract! barang_keluar, :id, :stok_id, :qty, :created_at, :updated_at
json.url barang_keluar_url(barang_keluar, format: :json)
