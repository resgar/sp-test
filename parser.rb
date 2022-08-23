#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/evaluator'
require_relative 'lib/analyzer'

abort 'The file parameter is required.' if ARGV.empty?

file_path = ARGV[0]

abort 'No such file.' unless File.exist?(file_path)

file = File.open(file_path)

evaluator = Evaluator.new(file)
data = evaluator.call

analyzer = Analyzer.new(data)

analysis = analyzer.call
uniq_analysis = analyzer.call(&:uniq)

puts 'Pages views:'
puts analysis

puts 'Unique page views:'
puts uniq_analysis
