#!/usr/bin/env ruby
# frozen_string_literal: true

abort 'The file parameter is required.' if ARGV.empty?

file_path = ARGV[0]

abort 'No such file.' unless File.exist?(file_path)
