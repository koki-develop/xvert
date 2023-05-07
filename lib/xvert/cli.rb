# frozen_string_literal: true

require "thor"

module Xvert
  class CLI < Thor
    class << self
      def exit_on_failure?
        true
      end
    end

    #
    # JSON => X
    #

    desc "jy", "Convert JSON to YAML"
    def jy
      run(from: :json, to: :yaml)
    end

    desc "jt", "Convert JSON to TOML"
    def jt
      run(from: :json, to: :toml)
    end

    #
    # YAML => X
    #

    desc "yj", "Convert YAML to JSON"
    def yj
      run(from: :yaml, to: :json)
    end

    desc "yt", "Convert YAML to TOML"
    def yt
      run(from: :yaml, to: :toml)
    end

    #
    # TOML => X
    #

    desc "tj", "Convert TOML to JSON"
    def tj
      run(from: :toml, to: :json)
    end

    desc "ty", "Convert TOML to YAML"
    def ty
      run(from: :toml, to: :yaml)
    end

    private

    def run(from:, to:)
      puts ::Xvert.convert(input, from: from, to: to)
    end

    def input
      $stdin.readlines.join
    end
  end
end
