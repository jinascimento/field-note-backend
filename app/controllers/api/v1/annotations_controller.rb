# frozen_string_literal: true

module Api
  module V1
    class AnnotationsController < ApplicationController
      protect_from_forgery with: :null_session
      skip_before_action :verify_authenticity_token
      before_action :authorize_request

      def index
        @annotations = Annotation.where(user_id: @current_user.id)
        json_response(@annotations)
      end

      def create
        annotation = Annotations::AnnotationCreator.new(
          annotation_params.merge(user_id: @current_user.id)
        ).call

        json_response(annotation, :created)
      end

      private
      def annotation_params
        params.require(:annotation).permit(:description, :latitude, :longitude, :noted_at)
      end
    end
  end
end