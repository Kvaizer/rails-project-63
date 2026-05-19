# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_output_form_tag
    user = User.new name: 'Rob'
    result = HexletCode.form_for user do |_f|
      ''
    end

    assert_equal '<form action="#" method="post"></form>', result
  end

  def test_output_form_tag_with_url
    user = User.new(name: 'rob', job: 'hexlet')

    result = HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |_f|
      ''
    end

    assert_equal '<form action="/profile" method="post" class="hexlet-form"></form>', result
  end

  def test_output_form_with_entry_tags
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal fixture('form_with_entry_tags'), result
  end

  def test_textarea_with_cols_and_rows
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    result = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal fixture('textarea_with_cols_and_rows'), result
  end

  def test_form_with_submit
    user = User.new job: 'hexlet'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal fixture('form_with_submit'), result
  end

  def test_form_with_custom_submit
    user = User.new job: 'hexlet'

    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal fixture('form_with_custom_submit'), result
  end

  def test_non_existent_value
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    assert_raises NoMethodError do
      HexletCode.form_for user, url: '#' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
