# frozen_string_literal: true

require 'spec_helper'

describe 'parser' do
  subject { system "./parser.rb #{file_path}" }

  context 'when no file specifed' do
    let(:file_path) { nil }

    specify do
      expect { subject }.to output(/The file parameter is required/).to_stderr_from_any_process
    end
  end

  context "when the file doesn't exist" do
    let(:file_path) { 'unknown_file' }

    specify do
      expect { subject }.to output(/No such file/).to_stderr_from_any_process
    end
  end

  context 'when the file exists' do
    let(:file_path) { 'spec/fixtures/files/webserver.log' }

    specify do
      expect { subject }.to output(/List of webpages/).to_stdout_from_any_process
    end

    specify do
      expect { subject }.to output(/List of unique page views/).to_stdout_from_any_process
    end
  end
end
