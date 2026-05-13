# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(name, **props)
      open_tag = build_open_tag(name, props)

      if SINGLE_TAGS.include?(name)
        open_tag
      elsif block_given?
        "#{open_tag}#{yield}</#{name}>"
      else
        "#{open_tag}</#{name}>"
      end
    end

    def self.build_open_tag(name, props)
      props_str = props.map do |key, value|
        "#{key}=\"#{value}\""
      end.join(' ')

      props_str.empty? ? "<#{name}>" : "<#{name} #{props_str}>"
    end
  end
end
