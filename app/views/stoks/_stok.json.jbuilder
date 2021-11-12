json.extract! stok, :id, :nama_produk, :qty, :created_at, :updated_at
json.url stok_url(stok, format: :json)
