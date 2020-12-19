module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_api_user

    def connect
      self.current_api_user = find_verified_user
    end

    private

    def find_verified_user
      access_token = request.params[:'access_token']
      client_id = request.params[:client]
      verified_user = User.find_by(email: client_id)
      if verified_user && verified_user.valid_token?(access_token, client_id)
        verified_user
      else
        reject_unauthorized_connection
      end

    end
  end
end
