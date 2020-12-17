class User < ApplicationRecord
  has_secure_password

  def self.from_token_request request
      login = request.params["auth"] && request.params["auth"]["login"]
      
      find_username = self.find_by username: login
      if find_username
        return find_username
      else
        return self.find_by email: login
      end
  end

  def to_token_payload
    {
      sub: id,
      email: email,
      username: username,
      name: name
    }
  end
end
