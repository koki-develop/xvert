# frozen_string_literal: true

require_relative "lib/xvert/version"

Gem::Specification.new do |spec|
  spec.name = "xvert"
  spec.version = Xvert::VERSION
  spec.authors = ["koki-develop"]
  spec.email = ["kou.pg.0131@gmail.com"]

  spec.summary = "Convert between various formats."
  spec.description = "Convert between JSON, YAML, TOML, and various other formats."
  spec.homepage = "https://github.com/koki-develop/xvert"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", "~> 7.0.0"
  spec.add_runtime_dependency "json", "~> 2.6.0"
  spec.add_runtime_dependency "rouge", "~> 4.1.0"
  spec.add_runtime_dependency "thor", "~> 1.2.0"
  spec.add_runtime_dependency "toml-rb", "~> 2.2.0"
  spec.add_runtime_dependency "yaml", "~> 0.2.0"
end
