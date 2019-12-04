require 'rails_helper'

RSpec.describe Users::UserCreator, type: :service do
  describe 'Create user' do
    context 'happy way' do
      it 'Should create user with validate params' do
        user = build(:user).attributes
        user.delete('password_digest')
        user['password'] = '123456'
        expect { Users::UserCreator.new(user).call }.to change { User.all.size }
                                                               .by(1)
      end
    end

    context 'bad way' do
      it 'Not should create user with invalid params' do
        user = build(:user).attributes
        user['email'] = nil
        expect { Users::UserCreator.new(user).call }.to raise_error(ActiveRecord::RecordInvalid)
      end

    end
  end
end