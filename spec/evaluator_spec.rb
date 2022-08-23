# frozen_string_literal: true

require 'spec_helper'
require 'evaluator'

describe Evaluator do
  file = File.open('spec/fixtures/files/webserver.log').first(10)
  subject(:evaluator) { Evaluator.new(file) }

  it 'returns a hash with the path and IPs' do
    expect(subject.call).to eq(
      { '/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],
        '/contact' => ['184.123.665.067'],
        '/home' => ['184.123.665.067', '235.313.352.950'],
        '/about/2' => ['444.701.448.104'],
        '/index' => ['444.701.448.104'],
        '/about' => ['061.945.150.735'] }
    )
  end
end
