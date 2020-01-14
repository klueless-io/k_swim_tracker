# frozen_string_literal: true

RSpec.describe '`k_swim_tracker config` command', type: :cli do
  it 'executes `k_swim_tracker help config` command successfully' do
    output = `k_swim_tracker help config`
    expected_output = <<~OUT
      Usage:
        k_swim_tracker config KEY, VALUE

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Config description
    OUT

    expect(output).to eq(expected_output)
  end
end
