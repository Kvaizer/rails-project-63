# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'minitest/autorun'
require 'hexlet_code'

def fixture(name)
  File.read(File.join(__dir__, 'fixtures', "#{name}.html")).strip
end
