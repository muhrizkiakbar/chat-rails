class UserSerializer
  include JSONAPI::Serializer
  attributes :nickname, :name

end
