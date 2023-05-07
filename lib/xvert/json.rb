# frozen_string_literal: true

module Xvert
  class << self
    def json_to_yaml(text)
      json_to_object(text).to_yaml
    end

    private

    def json_to_object(text)
      JSON.parse(text)
    end
  end
end
