require 'spec_helper'
module Alf
  module Repl
    describe Service, "get /" do
      include ::Rack::Test::Methods

      def app
        Service
      end

      subject{
        get('/')
      }

      before do
        subject
      end

      it 'serves html correctly' do
        last_response.should be_ok
        last_response.content_type.should =~ /text\/html/
      end

      it 'composes the repl' do
        last_response.body.should =~ /<html/
        last_response.body.should =~ /QueryController/
      end

    end
  end
end
