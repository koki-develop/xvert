# frozen_string_literal: true

require "rouge"
require "thor"

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
      when :yaml then Rouge::Lexers::YAML.new
      when :toml then Rouge::Lexers::TOML.new
      else raise UnsupportedFormatError, format
      end
    end

    def input
      $stdin.readlines.join
    end
  end
end
