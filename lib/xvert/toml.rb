# frozen_string_literal: true

module Xvert
  class << self
    def toml_to_json(text)
      toml_to_object(text).to_json
    end

    def toml_to_yaml(text)
      toml_to_object(text).to_yaml
    end

    private

    def toml_to_object(text)
      Tomlrb.parse(text)
    end
  end
end
