class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  def not_found
    json_response({ message: 'not found' }, :not_found)
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      json_response({ message: e.message }, :unauthorized)
    rescue JWT::DecodeError => e
      json_response({ message: e.message }, :unauthorized)
    end
  end
end
