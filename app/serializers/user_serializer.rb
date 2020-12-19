class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :nickname, :name
end
