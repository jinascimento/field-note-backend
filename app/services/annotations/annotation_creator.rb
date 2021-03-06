# frozen_string_literal: true

module Annotations
  class AnnotationCreator

    def initialize(attributes)
      @attributes = attributes
    end

    def call
      Annotation.create!(@attributes)
    end
  end
end
