# frozen_string_literal: true

require "thor"

module Xvert
  class CLI < Thor
    class << self
      def exit_on_failure?
        true
      end
    end

    desc "jy", "Convert JSON to YAML"
    def jy
      puts Xvert.json_to_yaml($stdin.readlines.join)
    end

    desc "yj", "Convert YAML to JSON"
    def yj
      puts Xvert.yaml_to_json($stdin.readlines.join)
    end
  end
end