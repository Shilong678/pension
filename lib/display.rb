# frozen_string_literal: true

require File.expand_path 'database.rb', __dir__
class Display
  attr_reader :answer
  def initialize
    welcome_message
    @answer = question
  end

  def run
    if answer == 1 || answer == 2
      display
    else
      puts 'Please press 1 or 2'
    end
  end


  private

  def display
    Database.sorted(answer)
  end

  def welcome_message
    puts 'Welcome to Web log parser'
    puts 'Press 1 for most visited pages '
    puts 'Press 2 for list of webpages with most unique page views '
  end

  def question
    $stdin.gets.chomp.to_i
  end
end
