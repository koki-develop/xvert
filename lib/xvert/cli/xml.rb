# frozen_string_literal: true

module Xvert
  class CLI < Thor
    desc "xj", "Convert XML to JSON"
    def xj
      x(:json)
    end

    desc "xt", "Convert XML to TOML"
    def xt
      x(:toml)
    end

    desc "xx", "Convert XML to XML"
    def xx
      x(:xml)
    end

    desc "xy", "Convert XML to YAML"
    def xy
      x(:yaml)
    end

    private

    def x(format)
      run(from: :xml, to: format)
    end
  end
end
