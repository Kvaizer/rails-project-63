# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module HexletCode
  class Error < StandardError; end

  def self.form_for(user, **attrs)
    action = attrs.delete(:url) || '#'
    field_builder = FieldBuilder.new(user)

    yield field_builder if block_given?

    HexletCode::Tag.build('form', action: action, method: 'post', **attrs) do
      field_builder.render
    end
  end
end
