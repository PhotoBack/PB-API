class ApiController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def upload
    current_user.images.create(path: params['file'])
    render json: "success"
  end
end
