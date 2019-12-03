# frozen_string_literal: true

module Users
  class UserUpdater
    def initialize(user, attributes)
      @user = user
      @attributes = attributes
    end

    def call
      @user.update!(@attributes)
    end
  end
end
