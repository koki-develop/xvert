# frozen_string_literal: true

require "json"
require "toml-rb"
require "yaml"
require_relative "xvert/version"
require_relative "xvert/cli"

module Xvert
  class UnsupportedFormatError < StandardError
    def initialize(format)
      super("Unsupported format: #{format}")
    end
  end

  class << self
    def convert(text, from:, to:)
      object = to_object(text, format: from)
      to_text(object, format: to)
    end

    def to_object(text, format:)
      case format
      when :json then json_to_object(text)
      when :yaml then yaml_to_object(text)
      when :toml then toml_to_object(text)
      else raise UnsupportedFormatError, format
      end
    end

    def to_text(object, format:)
      case format
      when :json then object_to_json(object)
      when :yaml then object_to_yaml(object)
      when :toml then object_to_toml(object)
      else raise UnsupportedFormatError, format
      end
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
