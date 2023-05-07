# frozen_string_literal: true

require "test_helper"
require_relative "../lib/xvert"

class TestXvert < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Xvert::VERSION
  end

  #
  # json to yaml
  #

  def test_json_to_yaml
    json = '{ "foo": 1, "bar": 2 }'
    yaml = <<~YAML
      ---
      foo: 1
      bar: 2
    YAML
    assert_equal yaml, ::Xvert.json_to_yaml(json)
  end

  def test_json_to_yaml_with_array
    json = '[{ "foo": 1 }, { "bar": 2 }]'
    yaml = <<~YAML
      ---
      - foo: 1
      - bar: 2
    YAML
    assert_equal yaml, ::Xvert.json_to_yaml(json)
  end
end
