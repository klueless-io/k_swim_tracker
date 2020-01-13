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
  end
end
