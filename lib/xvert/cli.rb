# frozen_string_literal: true

require "rouge"
require "thor"
require_relative "cli/json"
require_relative "cli/toml"
require_relative "cli/xml"
require_relative "cli/yaml"

module Xvert
  class CLI < Thor
    class << self
      def exit_on_failure?
        true
      end
    end

    map %w[-v --version] => :version

    desc "--version, -v", "Print Xvert version"
    def version
      puts ::Xvert::VERSION
    end

    private

    def run(from:, to:)
      text = ::Xvert.convert(input, from: from, to: to).chomp
      puts highlight(text, to)
    end

    def highlight(text, format)
      return text unless $stdout.isatty

      formatter(Rouge::Themes::Monokai.new).format(lexer(format).lex(text))
    end

    def formatter(theme)
      Rouge::Formatters::Terminal256.new(theme)
    end

    def lexer(format)
      case format
      when :json then Rouge::Lexers::JSON.new
      when :toml then Rouge::Lexers::TOML.new
      when :yaml then Rouge::Lexers::YAML.new
      when :xml then Rouge::Lexers::XML.new
      else raise UnsupportedFormatError, format
      end
    end

    def input
      $stdin.readlines.join
    end
  end
end
