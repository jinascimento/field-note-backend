require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  it '#new' do
    get :new
    expect(response).to be_successful
  end

  it '#edit' do
    user = create(:user)
    get :edit, params: { id: user.id }
    expect(response).to be_successful
  end

  it '#index' do
    get :index
    expect(response).to be_successful
  end

  describe '#create' do
    it '#create when params is valid' do
      user = build(:user).attributes
      user.delete('password_digest')
      user['password'] = '123456'

      expect { post :create, params: { user: user } }.to change { User.all.size }
                                                             .by(1)
    end

    it '#not create when params is invalid' do
      user = build(:user).attributes
      user.delete('password_digest')

      expect { post :create, params: { user: user } }.not_to change { User.all.size }
    end
  end

  describe '#update' do
    it 'update when params is valid' do
      user = create(:user)
      user_id = user.id
      user_attributes = user.attributes
      user_attributes['name'] = 'Jhonatan'

      expect { put :update, params: { user: user_attributes, id: user_id } }
          .to change { user.reload.name }.to 'Jhonatan'
    end

    it 'update when params is valid' do
      user = create(:user)
      user_id = user.id
      user_attributes = user.attributes
      user_attributes['name'] = 'Jhonatan'
      user_attributes['email'] = ''

      expect { put :update, params: { user: user_attributes, id: user_id } }
          .not_to change { user.reload }
    end
  end
end
