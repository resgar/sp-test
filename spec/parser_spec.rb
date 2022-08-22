spec/parser_spec.rb# frozen_string_literal: true

require 'spec_helper'

describe 'parser' do
  subject { ->(file_path) { `./parser.rb #{file_path}` } }

  context 'when no file specifed' do
    specify do
      expect { subject.call(nil) }.to output("The file parameter is required.\n").to_stderr_from_any_process
    end
  end

  context "when the file doesn't exist" do
    specify do
      expect { subject.call('unknown_file') }.to output("No such file.\n").to_stderr_from_any_process
    end
  end
end
