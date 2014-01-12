json.array!(@penyakits) do |penyakit|
  json.extract! penyakit, :id, :nama, :deskripsi, :solusi
  json.url penyakit_url(penyakit, format: :json)
end
