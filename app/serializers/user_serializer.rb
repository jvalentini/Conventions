class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :address_id
end
