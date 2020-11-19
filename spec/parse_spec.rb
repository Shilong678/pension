# frozen_string_literal: true

require File.expand_path 'spec_helper.rb', __dir__
require File.expand_path '../lib/parse.rb', __dir__
require File.expand_path '../lib/database.rb', __dir__

describe 'Parser' do
  let(:file) {   'spec/fake_file.log' }
  let(:parser) { Parser.new(file) }
  let(:parsed) do
    [
      { page:'/help_page/1', ip: %w[126.318.035.038 929.398.951.889 722.247.931.582 646.865.545.408] },
      { page:'/contact', ip: %w[184.123.665.067] },
      { page:'/home', ip: %w[184.123.665.067 235.313.352.950] },
      { page:'/about/2', ip: %w[444.701.448.104] },
      { page:'/index', ip: %w[444.701.448.104] },
      { page:'/about', ip: %w[061.945.150.735] }
    ]
  end
  after(:each) do
    Database.reset
  end

  it 'refine the data' do
    parser.parse
    expect(Database.data).to eq parsed
  end


end
