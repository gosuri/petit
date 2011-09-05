require 'rack'

module Petit
  class Router
    class << self

      # Generates a Rack::Builder object for URLs mapped redirects
      #
      #   +links+ a hash of links to redirect
      #
      # Usage:
      #
      # require "petit"
      #
      # links = {
      #           '/foo'  => 'http://bar.com',
      #           '/piyo' => 'http//fuga.com'
      #         }
      # Petit::Router.application(links)
      #
      # Returns Rack::Builder
      def application(links = Petit.links)
        Rack::Builder.new do
          links.each do |source,dest|
            map source do
              run Proc.new {|env| RackHelper.redirect_response(dest)}
            end
          end
        end
      end


      # Starts the petit routing, this should be used in development mode
      # port    - port the server needs to start on (default: 4200)
      # server  - the type of server (default: webrick)
      # Returns nothing
      def server(port = 4200, server ='webrick')
        Rack::Server.new(:app => application, :Port => port, :server => server).start
      end

    end
  end
end
