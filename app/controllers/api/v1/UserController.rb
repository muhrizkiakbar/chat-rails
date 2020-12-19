class Api::V1::UserController < ApplicationController
  before_action :authenticate_api_user!
  include JSONAPI::Filtering

  def index
    @users = User.where("id != ?", current_api_user)
    #render json: User.where("id != ?", current_api_user)

    allowed = [:email, :name]

    jsonapi_filter(@users, allowed) do |filtered|
      render jsonapi: filtered.result
    end
  end

end
