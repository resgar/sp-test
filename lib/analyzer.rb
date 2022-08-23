# frozen_string_literal: true

class Analyzer
  def initialize(data)
    @data = data
  end

  def call
    data.map do |path, ips|
      ips = yield ips if block_given?
      { path:, ips: ips.count }
    end
  end

  private

  attr_reader :data
end
