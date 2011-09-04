require 'helper'

class TestPetit < Test::Unit::TestCase

  def setup
    @links = Petit.links
  end

  def test_load_link_files
    assert       @links.has_key? '/foo'
    assert_equal @links['/foo'], 'http://bar.com'
  end

  def test_root_link
    assert_equal @links['/'], 'http://root.com'
  end
end

