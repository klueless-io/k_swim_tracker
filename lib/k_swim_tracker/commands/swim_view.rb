# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-table'

module KSwimTracker
  module Commands
    # Command Name goes here
    class SwimView < KSwimTracker::Command
      def initialize(options)
        @options = options
      end

      # Execute SwimView subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        data = config.read
        keys = data.keys.sort.reverse

        new_data = keys.map { |k| [data[k]['date'], data[k]['laps'], data[k]['notes']] }

        table = TTY::Table.new %w[Date Laps Notes], new_data
        puts table.render(:unicode)
      end
    end
  end
end
