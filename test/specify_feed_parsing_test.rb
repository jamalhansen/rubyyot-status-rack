require 'test_helper'

class SpecifyFeedParsingTest < Test::Unit::TestCase
  def setup
    @feed = File.read(File.join ["fixtures", "feed.rss"])
    @parser = Rubyyot::FeedParser.new lambda{ @feed }
    @items = @parser.parse
  end

  def test_accepts_a_lambda_that_gets_the_feed
    assert_equal @feed, @parser.document
  end

  def test_splits_items_into_enumerable
    assert_equal 2, @items.length
  end

  def test_titles
    assert_equal 47, @items[0][:title].length
    assert_equal 42, @items[1][:title].length
  end

  def test_links
    assert_equal 80, @items[0][:link].length
    assert_equal 72, @items[1][:link].length
  end

  def test_descriptions
    assert_equal 244, @items[0][:description].length
    assert_equal 258, @items[1][:description].length
  end
  
end