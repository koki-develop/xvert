# frozen_string_literal: true

module Xvert
  class << self
    def yaml_to_json(text)
      yaml_to_object(text).to_json
    end

    private

    def yaml_to_object(text)
      YAML.safe_load(text)
    end
  end
end
