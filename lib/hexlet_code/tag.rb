# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(name, **props)
      props_str = props.map do |key, value|
        "#{key}=\"#{value}\""
      end.join(" ")

      open_tag = props_str.empty? ? "<#{name}>" : "<#{name} #{props_str}>"

      if SINGLE_TAGS.include?(name)
        open_tag
      elsif block_given?
        "#{open_tag}#{yield}</#{name}>"
      else
        "#{open_tag}</#{name}>"
      end
    end
  end
end
