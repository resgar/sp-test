# frozen_string_literal: true

require 'spec_helper'
require 'reporter'

describe Reporter do
  file = File.open('spec/fixtures/files/webserver.log').first(20)
  subject(:reporter) { Reporter.new(file) }

  specify do
    expect { subject.call }.to output(%r{help_page/1 6 visits}).to_stdout_from_any_process
  end

  specify do
    expect { subject.call }.to output(%r{help_page/1 5 unique views}).to_stdout_from_any_process
  end
end
