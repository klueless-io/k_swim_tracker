# frozen_string_literal: true

RSpec.describe '`k_swim_tracker swim` command', type: :cli do
  it 'executes `k_swim_tracker help swim` command successfully' do
    output = `k_swim_tracker help swim`
    expected_output = <<~OUT
      Usage:
        k_swim_tracker swim SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Swim lap tracking description
    OUT

    expect(output).to eq(expected_output)
  end
end
