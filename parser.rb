#!/usr/bin/env ruby
# frozen_string_literal: true

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

analysis = Hash.new { |h, k| h[k] = [] }

file.each do |line|
  path, ip = line.split(' ')
  analysis[path] << ip
end

page_views = analyze(analysis)
uniq_page_views = analyze(analysis, &:uniq)

puts 'Pages views:'
puts page_views

puts 'Unique page views:'
puts uniq_page_views
