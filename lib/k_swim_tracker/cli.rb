# frozen_string_literal: true

require 'thor'

module KSwimTracker
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'k_swim_tracker version'
    def version
      require_relative 'version'
      puts 'v' + KSwimTracker::VERSION
    end
    map %w[--version -v] => :version

    #
    # config
    #
    desc 'config KEYVALUE', 'Config description'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def config(key, value)
      if options[:help]
        invoke :help, ['config']
      else
        require_relative 'commands/config'
        KSwimTracker::Commands::Config.new(key, value, options).execute
      end
    end
    
    #
    # swim
    #
    desc 'swim SUBCOMMAND', 'Swim lap tracking description'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def swim(subcommand = :gui)
      if options[:help]
        invoke :help, ['swim']
      else
        require_relative 'commands/swim'
        KSwimTracker::Commands::Swim.new(subcommand, options).execute
      end
    end
  end
end
