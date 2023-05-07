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
      puts Xvert.convert(input, from: :json, to: :yaml)
    end

    desc "jt", "Convert JSON to TOML"
    def jt
      puts Xvert.convert(input, from: :json, to: :toml)
    end

    #
    # YAML => X
    #

    desc "yj", "Convert YAML to JSON"
    def yj
      puts Xvert.convert(input, from: :yaml, to: :json)
    end

    desc "yt", "Convert YAML to TOML"
    def yt
      puts Xvert.convert(input, from: :yaml, to: :toml)
    end

    #
    # TOML => X
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
