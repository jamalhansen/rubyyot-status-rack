module Rubyyot
  class HomepageBuilder
    require 'feed_parser'
    require 'erb'
 
    def self.build
      items_html = build_items

      file = File.read("page.erb")
      page_template = ERB.new(file, 0, "%<>")
      response_body = page_template.result binding
    end

    def self.build_items
     # begin
	parser = FeedParser.new lambda{ 
	  require 'open-uri'
	  open("http://blog.rubyyot.com/tag/rubyyot/feed/rss")
	}
	items = parser.parse 

	file = File.read("item_template.erb")
        post_template = ERB.new(file, 0, "%<>")
	post_template.result binding
      #rescue
	#"<h4>There was an error getting posts from blog.rubyyot.com.</h4>"
      #end
    end
  end
end

