# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module KSwimTracker
  module Commands
    # Command Name goes here
    class Config < KSwimTracker::Command
      def initialize(key, value, options)
        @key = key
        @value = value

        @options = options
      end

      # Execute Config command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
      end

    end
  end
end
