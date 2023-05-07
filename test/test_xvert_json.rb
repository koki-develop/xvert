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

  def test_json_to_hash
    json = '{ "foo": 1, "bar": 2 }'
    hash = { foo: 1, bar: 2 }
    assert_equal hash, ::Xvert.to_hash(json, format: :json)

    json = '[{ "foo": 1 }, { "bar": 2 }]'
    hash = [{ foo: 1 }, { bar: 2 }]
    assert_equal hash, ::Xvert.to_hash(json, format: :json)
  end

  def test_hash_to_json
    hash = { foo: 1, bar: 2 }
    json = <<~JSON.chomp
      {
        "foo": 1,
        "bar": 2
      }
    JSON
    assert_equal json, ::Xvert.to_text(hash, format: :json)

    hash = [{ foo: 1 }, { bar: 2 }]
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
    assert_equal json, ::Xvert.to_text(hash, format: :json)
  end
end
