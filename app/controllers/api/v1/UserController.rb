class Api::V1::UserController < ApplicationController
  before_action :authenticate_api_user!

  def index
    @users = User.where("id != ?", current_api_user)
    render jsonapi: User.where("id != ?", current_api_user)
  end

end
