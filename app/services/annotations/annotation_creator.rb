# frozen_string_literal: true

module Annotations
  class AnnotationCreator
    attr_reader :annotation

    def initialize(params)
      @params = params
    end

    def call
      Annotation.create!(@params)
    end
  end
end
