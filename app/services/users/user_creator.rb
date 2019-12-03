# frozen_string_literal: true

module Users
  class UserCreator
    def initialize(attributes)
      @attributes = attributes
    end

    def call
      @user = User.create!(@attributes)
    end
  end
end
