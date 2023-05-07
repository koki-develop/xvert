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
      puts Xvert.json_to_yaml($stdin.readlines.join)
    end

    #
    # YAML
    #

    desc "yj", "Convert YAML to JSON"
    def yj
      puts Xvert.yaml_to_json($stdin.readlines.join)
    end

    #
    # TOML
    #

    desc "tj", "Convert TOML to JSON"
    def tj
      puts Xvert.toml_to_json($stdin.readlines.join)
    end

    desc "ty", "Convert TOML to YAML"
    def ty
      puts Xvert.toml_to_yaml($stdin.readlines.join)
    end
  end
end
