module Petit
  module RackHelper
    class << self

      # Generated a three part response for redirects
      def redirect_response(url)
        [301, redirect_headers(url), [""]]
      end

      # Generates a CGI-like redirect header hash 
      # for the given url
      def redirect_headers(url)
        {
          "Content-Type" => "text/plain",
          "Location" => url
        }
      end
    end
  end
end
