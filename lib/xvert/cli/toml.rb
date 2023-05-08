# frozen_string_literal: true

module Xvert
  class CLI < Thor
    desc "tj", "Convert TOML to JSON"
    def tj
      t(:json)
    end

    desc "tt", "Convert TOML to TOML"
    def tt
      t(:toml)
    end

    desc "ty", "Convert TOML to YAML"
    def ty
      t(:yaml)
    end

    desc "tx", "Convert TOML to XML"
    def tx
      t(:xml)
    end

    private

    def t(format)
      run(from: :toml, to: format)
    end
  end
end
