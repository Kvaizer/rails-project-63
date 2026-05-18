# frozen_string_literal: true

module HexletCode
  class FieldBuilder
    def initialize(user)
      @user = user
      @fields = []
    end

    def input(field_name, **options)
      field_type = options.delete(:as)
      value = @user.public_send(field_name)

      tag = if field_type == :text
              build_textarea(field_name, value, options)
            else
              build_input(field_name, value, options)
            end

      @fields << tag
      tag
    end

    def render
      @fields.join
    end

    private

    def build_textarea(field_name, value, options)
      props = { name: field_name, cols: 20, rows: 40 }.merge(options)

      Tag.build('textarea', **props) do
        value
      end
    end

    def build_input(field_name, value, options)
      props = { name: field_name, type: 'text', value: value }.merge(options)

      Tag.build('input', **props)
    end
  end
end
