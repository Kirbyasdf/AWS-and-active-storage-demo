class UserSerializer < ActiveModel::Serializer
  has_many :images
  attributes :id, :name
end
