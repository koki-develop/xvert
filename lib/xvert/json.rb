# frozen_string_literal: true

require "json"
require "yaml"

module Xvert
  class << self
    def json_to_yaml(text)
      JSON.parse(text).to_yaml
    end
  end
end
