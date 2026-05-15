# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_output_form_tag
    user = User.new name: 'Rob'
    result = HexletCode.form_for user do |_f|
      ''
    end

    assert_equal '<form action="#" method="post"></form>', result
  end

  def test_form_for_with_url
    user = User.new(name: 'rob', job: 'hexlet')

    result = HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |_f|
      ''
    end

    assert_equal '<form action="/profile" method="post" class="hexlet-form"></form>', result
  end
end
