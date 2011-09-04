require 'rack'
require 'yaml'

module Petit
  class Router
    class << self
      # Rack builder for url redirects
      def builder(links = Petit.links)
        @builder ||= Rack::Builder.new do
          links.each do |key,url|
            map "/#{key}" do
              run Proc.new {|env| RackHelper.redirect_response(url)}
           end
          end
        end
      end

      def server(port = 9292)
        Rack::Server.new(:app => builder, :Port => port, :server => 'webrick').start
      end

    end
  end
end
