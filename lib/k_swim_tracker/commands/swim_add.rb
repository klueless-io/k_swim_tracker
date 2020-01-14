# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module KSwimTracker
  module Commands
    # Command Name goes here
    class SwimAdd < KSwimTracker::Command
      def initialize(options)
        @options = options
      end

      # Execute SwimAdd subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        date = prompt.ask('Date', convert: :date, value: DateTime.now.strftime('%d/%m/%Y'))
        laps = prompt.ask('Laps', convert: :int, default: 0) do |q|
          q.in '1-1000'
          q.messages[:range?] = '%{value} out of expected range %{in}' # rubocop:disable all
        end

        notes = prompt.ask('Notes')

        write(date, laps, notes)
      end

      def write(date, laps, notes) # rubocop:disable all
        # Pattern: 'record_2020_001' for January 1st, 2020
        key = "record_#{date.year}_#{date.yday.to_s.rjust(3, '0')}"

        config.read
        config.set(key, :date, value: date.to_s)
        config.set(key, :laps, value: laps.to_s)
        config.set(key, :notes, value: notes.to_s)
        config.write force: true
      end
    end
  end
end
