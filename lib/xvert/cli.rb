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

    #
    # TOML => X
    #

    desc "tj", "Convert TOML to JSON"
    def tj
      t(:json)
    end

    desc "tt", "Convert TOML to TOML"
    def tt
      t(:toml)
    end

    desc "ty", "Convert TOML to YAML"
    def ty
      t(:yaml)
    end

    desc "tx", "Convert TOML to XML"
    def tx
      t(:xml)
    end

    #
    # XML
    #

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

    #
    # YAML => X
    #

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

    # ---

    private

    def j(format)
      run(from: :json, to: format)
    end

    def t(format)
      run(from: :toml, to: format)
    end

    def x(format)
      run(from: :xml, to: format)
    end

    def y(format)
      run(from: :yaml, to: format)
    end

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
