class Gejala
  include Mongoid::Document
  field :nama, type: String
  has_and_belongs_to_many  :penyakits
end
