require 'rails_helper'

RSpec.describe Annotations::AnnotationCreator, type: :service do
  describe 'Create annotation' do
    context 'happy way' do
      it 'Should create annotation with validate params' do
        annotation = build(:annotation, user_id: create(:user).id)
        expect { Annotations::AnnotationCreator.new(annotation.attributes).call }.to change { Annotation.all.size }
                                                            .by(1)
      end
    end

    context 'bad way' do
      it 'Not should create annotation without user' do
        annotation = build(:annotation)
        expect { Annotations::AnnotationCreator.new(annotation.attributes).call }.to raise_error(ActiveRecord::RecordInvalid)
      end

    end
  end
end