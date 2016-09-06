class ApplicationController < ActionController::Base
  def notifications
    render json: params
  end
end
