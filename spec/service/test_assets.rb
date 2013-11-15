require 'spec_helper'
module Alf
  module Repl
    describe Service, "assets" do
      include ::Rack::Test::Methods

      def app
        Service
      end

      it 'serves css correctly' do
        get '/assets/style.css'
        last_response.should be_ok
        last_response.content_type.should =~ /text\/css/
      end

      it 'serves js correctly' do
        get '/assets/application.js'
        last_response.should be_ok
        last_response.content_type.should =~ /application\/javascript/
      end

    end
  end
end
