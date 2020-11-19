# frozen_string_literal: true

require File.expand_path 'database.rb', __dir__

class Parser
  attr_reader :file, :raw_data
  def initialize(file)
    @file = file
    @raw_data = store
  end

  def parse
    pages.each do |page|
      Database.create(page: page,
                      ip: create_an_array_of_ips(find_ips(page)))
    end
  end

  private

  def store
    File.open(file).map(&:split)
  end

  def pages
    raw_data.map { |el| el[0] }.uniq
  end

  def find_ips(value)
    raw_data.select { |el| el[0] == value }
  end

  def create_an_array_of_ips(ips)
    ips.each_with_object([]) { |value, array| array << value[1] }
  end
end
