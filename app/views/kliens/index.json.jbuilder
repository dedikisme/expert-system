json.array!(@kliens) do |klien|
  json.extract! klien, :id, :nama, :alamat, :email, :ip
  json.url klien_url(klien, format: :json)
end
