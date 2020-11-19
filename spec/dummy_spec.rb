# frozen_string_literal: true

require File.expand_path 'spec_helper.rb', __dir__
require File.expand_path '../lib/dummy.rb', __dir__

describe 'Dummy' do
  let(:dummy) { Dummy.new }
  let(:sample) do
    [%w[home ip1], %w[about ip2], %w[home ip4], %w[contact ip2],
     %w[about ip3], %w[home ip2], %w[about ip3], %w[home ip6],
     %w[contact ip3], %w[about ip3], %w[home ip5], %w[about ip3], %w[about ip3]]
  end
  let(:pages) { %w[home about contact] }
  let(:parsed) do
    [
      { home: %w[ip1 ip4 ip2 ip6 ip5] },
      { about: %w[ip2 ip3 ip3 ip3 ip3 ip3] },
      { contact: %w[ip2 ip3] }
    ]
  end

  let(:home_ips_linked) do
    [%w[home ip1], %w[home ip4], %w[home ip2],
     %w[home ip6], %w[home ip5]]
  end

  it 'store log file into an array' do
    file = 'spec/fake_file.log'
    result = [
      %w[/help_page/1 126.318.035.038],
      %w[/contact 184.123.665.067],
      %w[/home 184.123.665.067],
      %w[/about/2 444.701.448.104],
      %w[/help_page/1 929.398.951.889],
      %w[/index 444.701.448.104],
      %w[/help_page/1 722.247.931.582],
      %w[/about 061.945.150.735],
      %w[/help_page/1 646.865.545.408],
      %w[/home 235.313.352.950]
    ]
    expect(dummy.store(file)).to eq result
  end

  it 'get all pages' do
    expect(dummy.get_pages(sample)).to eq pages
  end

  it 'find all ips link to pages' do
    expect(dummy.find_ips(sample, 'home')).to eq home_ips_linked
  end

  it 'create an array of ips' do
    result = %w[ip1 ip4 ip2 ip6 ip5]
    expect(dummy.create_an_array_of_ips(home_ips_linked)).to eq result
  end
end
