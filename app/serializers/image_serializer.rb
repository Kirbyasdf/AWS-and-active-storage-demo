class ImageSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :name, :user_id
end
