# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module KSwimTracker
  module Commands
    # Command Name goes here
    class Swim < KSwimTracker::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Swim command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        case @subcommand
        when :gui
          gui
        when :add
          require_relative 'swim_add'
          subcmd = KSwimTracker::Commands::SwimAdd.new({})
        when :view
          require_relative 'swim_view'
          subcmd = KSwimTracker::Commands::SwimView.new({})
        end
        subcmd&.execute(input: input, output: output)
      end

      private

      def gui
        prompt = TTY::Prompt.new

        choices = [
          'add',
          'view',
          { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, cycle: true)

        command = KSwimTracker::Commands::Swim.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
