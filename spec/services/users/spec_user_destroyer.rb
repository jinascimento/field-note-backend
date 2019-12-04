require 'rails_helper'

RSpec.describe Users::UserDestroyer, type: :service do
  describe 'Destroy user' do
    context 'happy way' do
      it 'Should destroy user' do
        user = create(:user)
        expect { Users::UserDestroyer.new(user).call }.to change { User.all.size }
      end
    end
  end
end