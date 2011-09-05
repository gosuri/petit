module Petit
  module RackHelper
    class << self

      # Generates a three part cached response for
      # redirects with the url provided
      #
      # Example:
      #
      #   RackHelper.redirect_response("http://foo.com")
      #   # above will return:
      #   # [ 301,
      #   #   {
      #   #     "Content-Type" => "text/plain",
      #   #     "Location" => "http://foo.com",
      #   #     "Cache-Control" => "max-age=7200, public"
      #   #   },
      #   #   [""]
      #   #  ]
      #
      # Returns an array
      def redirect_response(url)
        [301, cached(redirect_headers(url)), [""]]
      end

      # Generates a CGI-like redirect header hash
      # for the given url
      #  +url+ redirect url
      #
      # Returns an array
      def redirect_headers(url)
        {
          "Content-Type" => "text/plain",
          "Location" => url
        }
      end

      # Appends HTTP cache headers to the hash
      #
      #  headers - Hash http headers
      #  max_age - Cache expire maximum age (default: 7200)
      #
      # Returns a Hash
      def cached(headers={}, max_age = 7200)
        headers.merge({'Cache-Control' => "max-age=#{max_age}, public"})
      end
    end
  end
end
