# frozen_string_literal: true

require "json"
require "toml-rb"
require "yaml"
require_relative "xvert/version"
require_relative "xvert/cli"

module Xvert
  TO_HASH_MAP = {
    json: :json_to_hash,
    yaml: :yaml_to_hash,
    toml: :toml_to_hash
  }.freeze

  TO_TEXT_MAP = {
    json: :hash_to_json,
    yaml: :hash_to_yaml,
    toml: :hash_to_toml
  }.freeze

  private_constant :TO_HASH_MAP, :TO_TEXT_MAP

  class << self
    def convert(text, from:, to:)
      hash = to_hash(text, format: from)
      to_text(hash, format: to)
    end

    private

    def to_hash(text, format:)
      send(TO_HASH_MAP[format], text)
    end

    def to_text(hash, format:)
      send(TO_TEXT_MAP[format], hash)
    end

    # JSON

    def json_to_hash(text)
      JSON.parse(text)
    end

    def hash_to_json(hash)
      JSON.pretty_generate(hash)
    end

    # YAML

    def yaml_to_hash(text)
      YAML.unsafe_load(text)
    end

    def hash_to_yaml(hash)
      YAML.dump(hash)
    end

    # TOML

    def toml_to_hash(text)
      TomlRB.parse(text)
    end

    def hash_to_toml(hash)
      TomlRB.dump(hash)
    end
  end
end
