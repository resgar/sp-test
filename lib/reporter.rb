# frozen_string_literal: true

class Reporter
  def initialize(file)
    @analyzer = Analyzer.new(file)
  end

  def call
    reports = analyzer.call

    puts 'List of webpages:'
    reports.sort_by { |h| -h[:count] }.each do |report|
      puts "#{report[:path]} #{report[:count]} visits"
    end

    puts "\n"

    puts 'List of unique page views:'
    reports.sort_by { |h| -h[:uniq_count] }.each do |report|
      puts "#{report[:path]} #{report[:uniq_count]} unique views"
    end
  end

  private

  attr_reader :analyzer
end
