# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    it "is not valid without a required field" do
      user = User.new
      expect(user).to_not be_valid
    end

    it "is valid with all required fields" do
      user = create(:user)
      expect(user).to be_valid
    end
  end

  describe 'associations' do
    it 'has_many annotation' do
      user = create(:user, :with_annotations, qtt_annotations: 3)
      expect(user.annotations.count).to eq(3)
    end
  end
end