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
    assert_equal "---\nfoo: 1\nbar: 2\n", ::Xvert.json_to_yaml('{"foo": 1, "bar": 2}')
  end
end
