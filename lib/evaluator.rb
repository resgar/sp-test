# frozen_string_literal: true

class Evaluator
  def initialize(file)
    @file = file
  end

  def call
    result = Hash.new { |h, k| h[k] = [] }
    file.map do |line|
      path, ip = line.split(' ')
      result[path] << ip
    end
    result
  end

  private

  attr_reader :file
end
