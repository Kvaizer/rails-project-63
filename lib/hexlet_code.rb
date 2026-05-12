# frozen_string_literal: true

require_relative "hexlet_code/version"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module HexletCode
  class Error < StandardError; end
end
