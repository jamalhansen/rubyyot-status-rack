require 'test_helper'

class SpecifyHeaderBuildingTest < Test::Unit::TestCase
  def test_mime_type_specified
    page = Rubyyot::Homepage.new
    headers = page.build_headers_for ""
    assert headers.has_key? "Content-Type"
    assert_equal "text/html", headers["Content-Type"]
  end

  def test_length_specified
    page = Rubyyot::Homepage.new
    headers = page.build_headers_for "1df3ewfredfef"
    assert headers.has_key? "Content-Length"
    assert_equal "13", headers["Content-Length"]
  end

  def test_language_specified
    page = Rubyyot::Homepage.new
    headers = page.build_headers_for ""
    assert headers.has_key? "Content-Language"
    assert_equal "en", headers["Content-Language"]
  end
end