# frozen_string_literal: true

require File.expand_path 'spec_helper.rb', __dir__
require File.expand_path '../lib/message.rb', __dir__

describe 'Display' do

  it 'show most visited page' do
    result = /about has been visited 10 times/
    message =  Message.new(type: 1,page: 'about', number: 10)
    expect {message.sorted }.to output(result).to_stdout
  end

  it 'show most uniq visited page' do
    result = /index has 5 unique views/
    message = Message.new(type: 2, page: 'index',number: 5) 
    expect { message.sorted }.to output(result).to_stdout
  end
end
