json.array!(@gejalas) do |gejala|
  json.extract! gejala, :id, :nama
  json.url gejala_url(gejala, format: :json)
end
