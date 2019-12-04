module Authenticate
  def authenticate_token
    before(:each) do
      @user = create(:user)
      @user&.authenticate(@user.password)
      @token = JsonWebToken.encode(user_id: @user.id)
      request.headers['Authorization'] = "Bearer #{@token}"
    end
  end
end