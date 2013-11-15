require_relative 'repl/version'
require_relative 'repl/loader'
module Alf
  module Repl

    def self.database
      @database ||= begin
        adapter = ENV['DATABASE_URL']
        adapter = Alf.examples_adapter unless adapter
        raise "No database found" unless adapter
        Alf::Database.new(adapter)
      end
    end

    def self.database=(db)
      @database = db
    end

    def self.launch
      x = Class.new(Sinatra::Base) do
        def call(env)
          Alf::Repl::Service.call(env)
        end
      end
      x.run!
    end

  end # module Repl
end # module Alf
require_relative 'repl/ext'
require_relative 'repl/webapp'
require_relative 'repl/service'
