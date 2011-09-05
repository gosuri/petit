require 'helper'

class TestRackHelper < Test::Unit::TestCase

  def setup
    @url     = "http://foo.com"
    @headers = {"Content-Type" => "text/plain",
                "Location" => @url}
  end

  def test_redirect
    response = Petit::RackHelper.redirect_response(@url)
    assertion = [
                  301,
                  {
                    "Content-Type"=>"text/plain",
                    "Location"=>"http://foo.com",
                    "Cache-Control"=>"max-age=7200, public"
                  },
                  [""]
                ]
    assert_equal response, assertion 
  end

  def test_cached_headers
    headers = Petit::RackHelper.cached(@headers)
    assert_equal headers["Content-Type"], "text/plain"
    assert_equal headers["Location"], @url
    assert_equal headers["Cache-Control"], "max-age=7200, public"
   end

  def test_redirect_headers
    headers = Petit::RackHelper.redirect_headers(@url)
    assert_equal headers["Content-Type"], "text/plain"
    assert_equal headers["Location"], @url
  end
end
