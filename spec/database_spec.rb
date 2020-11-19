# frozen_string_literal: true

require File.expand_path 'spec_helper.rb', __dir__
require File.expand_path '../lib/database.rb', __dir__

describe 'Parse' do
  let(:file) {   'spec/fake_file.log' }
  let(:parsed) do
    [
      { page: '/help', ip: %w[a b c d e a f a b] },
      { page: '/contact', ip: %w[a a a a a a] },
      { page: '/home', ip: %w[a b c] },
      { page: '/about', ip: %w[a b b c d] },
      { page: '/index', ip: %w[e] }
    ]
  end

  before do
    parsed.each { |el| Database.create(el) }
  end
  after(:each) do
    Database.reset
  end

  it 'creates data' do
    expect(Database.data).to eq parsed
  end

  it 'sort data by most visited' do
    result = [
      { page: '/help', ip: %w[a b c d e a f a b] },
      { page: '/contact', ip: %w[a a a a a a] },
      { page: '/about', ip: %w[a b b c d] },
      { page: '/home', ip: %w[a b c] },
      { page: '/index', ip: %w[e] }
    ]

    expect(Database.sort(1)).to eq result
  end
  it 'sort data by uniq views' do
    result = [
      { page: '/help', ip: %w[a b c d e a f a b] },
      { page: '/about', ip: %w[a b b c d] },
      { page: '/home', ip: %w[a b c] },
      { page: '/index', ip: %w[e] },
      { page: '/contact', ip: %w[a a a a a a] }
    ]
    expect(Database.sort(2)).to eq result
  end
end
