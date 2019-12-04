require 'rails_helper'

RSpec.describe Users::UserUpdater, type: :service do
  describe 'Update user' do
    context 'happy way' do
      it 'Should update user with validate params' do
        user = create(:user)
        attributes = { name: 'Jhonatan' }

        expect { Users::UserUpdater.new(user, attributes).call }.to change { user.reload.name }.to 'Jhonatan'
      end
    end

    context 'bad way' do
      it 'Not should create user with invalid params' do
        user = create(:user)
        attributes = { email: nil, name: 'Jhonatan' }
        expect { Users::UserUpdater.new(user, attributes).call }.to raise_error(ActiveRecord::RecordInvalid)
      end

    end
  end
end