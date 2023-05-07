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
    # JSON
    #

    desc "jy", "Convert JSON to YAML"
    def jy
      puts Xvert.convert(input, from: :json, to: :yaml)
    end

    #
    # YAML
    #

    desc "yj", "Convert YAML to JSON"
    def yj
      puts Xvert.convert(input, from: :yaml, to: :json)
    end

    #
    # TOML
    #

    desc "tj", "Convert TOML to JSON"
    def tj
      puts Xvert.convert(input, from: :toml, to: :json)
    end

    desc "ty", "Convert TOML to YAML"
    def ty
      puts Xvert.convert(input, from: :toml, to: :yaml)
    end

    private

    def input
      $stdin.readlines.join
    end
  end
end
