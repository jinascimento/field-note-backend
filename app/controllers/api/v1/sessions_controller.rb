# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          json_response(token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                        username: @user.username)
        else
          json_response({ error: 'unauthorized' }, :unauthorized)
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
