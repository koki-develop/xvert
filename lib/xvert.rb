# frozen_string_literal: true

require "json"
require "toml-rb"
require "yaml"
require_relative "xvert/version"
require_relative "xvert/cli"

module Xvert
  TO_OBJECT_MAP = {
    json: :json_to_object,
    yaml: :yaml_to_object,
    toml: :toml_to_object
  }.freeze

  TO_TEXT_MAP = {
    json: :object_to_json,
    yaml: :object_to_yaml,
    toml: :object_to_toml
  }.freeze

  private_constant :TO_OBJECT_MAP, :TO_TEXT_MAP

  class << self
    def convert(text, from:, to:)
      object = to_object(text, format: from)
      to_text(object, format: to)
    end

    def to_object(text, format:)
      send(TO_OBJECT_MAP[format], text)
    end

    def to_text(object, format:)
      send(TO_TEXT_MAP[format], object)
    end

    private

    # JSON

    def json_to_object(text)
      JSON.parse(text)
    end

    def object_to_json(object)
      JSON.pretty_generate(object)
    end

    # YAML

    def yaml_to_object(text)
      YAML.unsafe_load(text)
    end

    def object_to_yaml(object)
      YAML.dump(object)
    end

    # TOML

    def toml_to_object(text)
      TomlRB.parse(text)
    end

    def object_to_toml(object)
      TomlRB.dump(object)
    end
  end
end
