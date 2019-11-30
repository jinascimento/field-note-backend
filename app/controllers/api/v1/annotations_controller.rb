# frozen_string_literal: true

module Api
  module V1
    class AnnotationsController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :authorize_request

      def index
        @annotations = Annotation.where(user_id: params[:user_id])
        json_response(@annotations)
      end

      def create
        @annotation = Annotation.create!(annotation_params)
        json_response(@annotation, :created)
      end

      private
      def annotation_params
        params.require(:annotation).permit(:description, :latitude, :longitude,
                                           :user_id)
      end
    end
  end
end