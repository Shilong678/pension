# frozen_string_literal: true

class Message
  attr_reader :type, :page, :number
  def initialize(args)
    @type = args[:type]
    @page = args[:page]
    @number = args[:number]
  end

  def sorted
    if type == 1
      puts "#{page} has been visited #{number} times"
    elsif type == 2
      puts "#{page} has #{number} unique views"
    else
      puts 'Please press 1 or 2'
    end
  end
end
