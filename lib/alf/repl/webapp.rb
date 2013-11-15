require 'sinatra/base'
module Alf
  module Repl
    class WebApp < Sinatra::Base
      set :public_folder,   Path.backfind('public')
      set :views,           Path.backfind('views')
      set :raise_errors,    true
      set :show_exceptions, false
      set :dump_errors,     true
      set :wlang,           {layout: :html5}

      get '/' do
        wlang :repl
      end

    end # class WebApp
  end # module Repl
end # module Alf
