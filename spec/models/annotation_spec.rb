require 'rails_helper'

RSpec.describe Annotation, type: :model do
  describe 'validates' do
    it "is not valid without a required field" do
      task = Annotation.new
      expect(task).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs_to user' do
      user = create(:user)
      annotation = create(:annotation,
                          user: user)
      expect(annotation.user).to_not be_nil
    end
  end
end