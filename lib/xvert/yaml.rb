# frozen_string_literal: true

module Xvert
  class << self
    def yaml_to_json(text)
      YAML.safe_load(text).to_json
    end
  end
end
