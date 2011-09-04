require "test/unit"
require "petit"

TEST_ROOT               = File.expand_path(File.dirname(__FILE__))
Petit.link_source       = File.join(TEST_ROOT,"links.yml")

