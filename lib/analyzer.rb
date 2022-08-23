# frozen_string_literal: true

class Analyzer
  def initialize(file)
    @evaluator = Evaluator.new(file)
  end

  def call
    data = evaluator.call
    data.map do |path, ips|
      { path:, count: ips.count, uniq_count: ips.uniq.count }
    end
  end

  private

  attr_reader :evaluator
end
