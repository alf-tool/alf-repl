require "alf-core"
require "alf-rack"
require "alf/rack/query"
require "rack"
require "rack/robustness"
require "sprockets"

require_relative 'nocache'
require_relative 'webapp'

module Alf
  module Repl
    Service = ::Rack::Builder.new do

      # Log everything on STDOUT
      use ::Rack::CommonLogger

      # Serve the assets through Sprockets
      map '/assets' do
        environment = Sprockets::Environment.new
        environment.append_path Path.backfind('assets/css')
        environment.append_path Path.backfind('assets/js')
        run environment
      end

      # Deploy the query ability under /query
      map '/query' do
        use ::Rack::Robustness do |g|
          g.status 400
          g.content_type "text/plain"
          g.body{|ex| ex.message }
        end
        use ::Rack::Nocache
        use ::Alf::Rack::Connect do |cfg|
          cfg.database = Repl.database
        end
        run ::Alf::Rack::Query.new{|q|
          q.type_check = false
          q.catch_all  = false
        }
      end

      run WebApp
    end # Service
  end # module Repl
end # module Alf
