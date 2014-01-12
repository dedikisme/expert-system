class Penyakit
  include Mongoid::Document
  field :nama, type: String
  field :deskripsi, type: String
  field :solusi, type: String

  has_and_belongs_to_many  :gejalas
end
