# frozen_string_literal: true

require "json"
require "yaml"
require_relative "xvert/version"

module Xvert
  def self.json_to_yaml(text)
    JSON.parse(text).to_yaml
  end
end
