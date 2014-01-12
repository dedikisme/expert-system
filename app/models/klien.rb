class Klien
  include Mongoid::Document
  field :nama, type: String
  field :alamat, type: String
  field :email, type: String
  field :ip, type: String
end
