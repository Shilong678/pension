# frozen_string_literal: true

require File.expand_path 'message.rb', __dir__

class Database
  def self.data
    @data ||= []
  end

  def self.create(args)
    data << { page: args[:page], ip: args[:ip] }
  end

  def self.sorted(answer)
    sort(answer).each do |el|
      Message.new(type: answer, page: el[:page],
                  number: el[:ip].by_unicity?(answer).length).sorted
    end
  end

  def self.sort(answer)
    data.sort_by { |el| el[:ip].by_unicity?(answer).length }.reverse
  end

  def self.reset
    @data = []
  end
end

class Array
  def by_unicity?(answer)
    answer == 2 ? uniq : itself
  end
end
