# frozen_string_literal: true

require 'spec_helper'
require 'evaluator'
require 'analyzer'

describe Analyzer do
  file = File.open('spec/fixtures/files/webserver.log').first(10)
  data = Evaluator.new(file).call
  subject(:analyzer) { Analyzer.new(data) }

  it 'returns page views' do
    expect(subject.call).to eq(
      [{ path: '/help_page/1', ips: 4 },
       { path: '/contact', ips: 1 },
       { path: '/home', ips: 2 },
       { path: '/about/2', ips: 1 },
       { path: '/index', ips: 1 },
       { path: '/about', ips: 1 }]
    )
  end

  it 'returns uniq page views' do
    expect(subject.call(&:uniq)).to eq(
      [{ path: '/help_page/1', ips: 4 },
       { path: '/contact', ips: 1 },
       { path: '/home', ips: 2 },
       { path: '/about/2', ips: 1 },
       { path: '/index', ips: 1 },
       { path: '/about', ips: 1 }]
    )
  end
end
