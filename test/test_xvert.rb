# frozen_string_literal: true

require "test_helper"
require_relative "../lib/xvert"

class TestXvert < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Xvert::VERSION
  end

  #
  # JSON
  #

  def test_json_to_object
    json = '{ "foo": 1, "bar": 2 }'
    object = { "foo" => 1, "bar" => 2 }
    assert_equal object, ::Xvert.to_object(json, format: :json)

    json = '[{ "foo": 1 }, { "bar": 2 }]'
    object = [{ "foo" => 1 }, { "bar" => 2 }]
    assert_equal object, ::Xvert.to_object(json, format: :json)
  end

  def test_object_to_json
    object = { foo: 1, bar: 2 }
    json = <<~JSON.chomp
      {
        "foo": 1,
        "bar": 2
      }
    JSON
    assert_equal json, ::Xvert.to_text(object, format: :json)

    object = [{ foo: 1 }, { bar: 2 }]
    json = <<~JSON.chomp
      [
        {
          "foo": 1
        },
        {
          "bar": 2
        }
      ]
    JSON
    assert_equal json, ::Xvert.to_text(object, format: :json)
  end

  #
  # YAML
  #

  def test_yaml_to_object
    yaml = <<~YAML
      ---
      foo: 1
      bar: 2
    YAML
    object = { "foo" => 1, "bar" => 2 }
    assert_equal object, ::Xvert.to_object(yaml, format: :yaml)
  end

  def test_object_to_yaml
    object = { "foo" => 1, "bar" => 2 }
    yaml = <<~YAML
      ---
      foo: 1
      bar: 2
    YAML
    assert_equal yaml, ::Xvert.to_text(object, format: :yaml)
  end
end
