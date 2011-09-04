require 'rack'

module Petit
  class Router
    class << self

      # Generates a Rack::Builder object for URLs mapped redirects
      #   +links+ a hash of links to redirect
      def builder(links = Petit.links)
        @builder ||= Rack::Builder.new do
          links.each do |source,dest|
            map source do
              run Proc.new {|env| RackHelper.redirect_response(dest)}
           end
          end
        end
      end

      # starts the petit routing server
      def server(port = 4200)
        Rack::Server.new(:app => builder, :Port => port, :server => 'webrick').start
      end

    end
  end
end
