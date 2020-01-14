# frozen_string_literal: true

require 'k_swim_tracker/commands/swim'

RSpec.describe KSwimTracker::Commands::Swim do

  let(:subcommand) { nil }
  let(:options) { {} }
  subject { KSwimTracker::Commands::Swim.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `swim` command successfully' do
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
