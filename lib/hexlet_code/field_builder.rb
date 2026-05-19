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

    def submit(field_name = 'Save')
      submit_tag = build_submit(field_name)
      @fields << submit_tag
      submit_tag
    end

    private

    def build_textarea(field_name, value, options)
      props = { name: field_name, cols: 20, rows: 40 }.merge(options)

      label = build_label(field_name)
      textarea = Tag.build('textarea', **props) do
        value
      end

      "#{label}#{textarea}"
    end

    def build_input(field_name, value, options)
      props = { name: field_name, type: 'text', value: value }.merge(options)

      label = build_label(field_name)
      input = Tag.build('input', **props)

      "#{label}#{input}"
    end

    def build_label(field_name)
      Tag.build('label', for: field_name) do
        field_name.to_s.capitalize
      end
    end

    def build_submit(value)
      props = { type: 'submit', value: value }
      Tag.build('input', **props)
    end
  end
end
