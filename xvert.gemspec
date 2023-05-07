# frozen_string_literal: true

require_relative "lib/xvert/version"

Gem::Specification.new do |spec|
  spec.name = "xvert"
  spec.version = Xvert::VERSION
  spec.authors = ["koki-develop"]
  spec.email = ["kou.pg.0131@gmail.com"]

  spec.summary = "Convert between various formats."
  spec.description = "Convert between CSV, JSON, YAML, and various other formats."
  spec.homepage = "https://github.com/koki-develop/xvert"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
