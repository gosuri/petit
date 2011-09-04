require 'helper'
require 'rack/mock'

class TestRouter < Test::Unit::TestCase

  def setup
    @links = {"foo" => "http://bar.com"}
  end

  def test_builder
    assertion = Petit::Router.builder(@links)
    response = Rack::MockRequest.new(assertion).get("/foo")
    assert_equal response.status, 301
    assert_equal response.headers["Location"], "http://bar.com"
  end

end
