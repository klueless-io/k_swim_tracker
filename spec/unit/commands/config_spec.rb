# frozen_string_literal: true

require 'k_swim_tracker/commands/config'

RSpec.describe KSwimTracker::Commands::Config do

  let(:key) { nil }
  let(:value) { nil }
  let(:options) { {} }
  subject { KSwimTracker::Commands::Config.new(key, value, options) }

  describe 'initialize' do
    it 'executes `config` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end

  describe 'execute' do
    before { subject.execute }

    context 'with XYZ' do
    end
  end
end
