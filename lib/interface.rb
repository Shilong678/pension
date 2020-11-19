# frozen_string_literal: true

require File.expand_path 'display.rb', __dir__
require File.expand_path 'parse.rb', __dir__

class Inteface
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def run
    if file.nil? || !File.exist?(file) || File.zero?(file)
      return puts 'Please provide correct file'
    end

    parser
    display
  end

  private

  def display
    Display.new.run
  end

  def parser
    Parser.new(file).parse
  end
end
