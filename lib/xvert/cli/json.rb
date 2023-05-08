# frozen_string_literal: true

module Xvert
  class CLI < Thor
    desc "jj", "Convert JSON to JSON"
    def jj
      j(:json)
    end

    desc "jy", "Convert JSON to YAML"
    def jy
      j(:yaml)
    end

    desc "jt", "Convert JSON to TOML"
    def jt
      j(:toml)
    end

    desc "jx", "Convert JSON to XML"
    def jx
      j(:xml)
    end

    private

    def j(format)
      run(from: :json, to: format)
    end
  end
end
