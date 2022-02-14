class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :coloc_id
end