# frozen_string_literal: true

require 'spec_helper'
require 'evaluator'
require 'analyzer'

describe Analyzer do
  file = File.open('spec/fixtures/files/webserver.log').first(20)
  subject(:analyzer) { Analyzer.new(file) }

  it 'returns page views' do
    expect(subject.call).to eq(
      [{ path: '/help_page/1', count: 6, uniq_count: 5 },
       { path: '/contact', count: 3, uniq_count: 2 },
       { path: '/home', count: 3, uniq_count: 3 },
       { path: '/about/2', count: 3, uniq_count: 2 },
       { path: '/index', count: 3, uniq_count: 3 },
       { path: '/about', count: 2, uniq_count: 2 }]
    )
  end
end
