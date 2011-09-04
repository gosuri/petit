require 'helper'

class TestRackHelper < Test::Unit::TestCase

  def setup
    @url = "http://foo.com"
  end

  def test_redirect
    response = Petit::RackHelper.redirect_response(@url)
    assert_equal response, [301, {"Content-Type" => "text/plain",
                                  "Location" => @url}, [""]
                           ]
  end

  def test_redirect_headers
    headers = Petit::RackHelper.redirect_headers(@url)
    assert_equal headers["Content-Type"], "text/plain"
    assert_equal headers["Location"], @url
  end
end
