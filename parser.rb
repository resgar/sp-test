#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/evaluator'

abort 'The file parameter is required.' if ARGV.empty?

file_path = ARGV[0]

abort 'No such file.' unless File.exist?(file_path)

def analyze(data)
  data.map do |path, ips|
    ips = yield ips if block_given?
    { path:, ips: ips.count }
  end
end

file = File.open(file_path)

evaluator = Evaluator.new(file)
data = evaluator.call

analysis = analyze(data)
uniq_analysis = analyze(data, &:uniq)

puts 'Pages views:'
puts analysis

puts 'Unique page views:'
puts uniq_analysis
