# frozen_string_literal: true

module Xvert
  class CLI < Thor
    desc "yj", "Convert YAML to JSON"
    def yj
      y(:json)
    end

    desc "yt", "Convert YAML to TOML"
    def yt
      y(:toml)
    end

    desc "yx", "Convert YAML to XML"
    def yx
      y(:xml)
    end

    desc "yy", "Convert YAML to YAML"
    def yy
      y(:yaml)
    end

    private

    def y(format)
      run(from: :yaml, to: format)
    end
  end
end
