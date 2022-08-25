#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/reporter'

abort 'The file parameter is required.' if ARGV.empty?

file_path = ARGV[0]

abort 'No such file.' unless File.exist?(file_path)

file = File.open(file_path)

Reporter.new(file).call
