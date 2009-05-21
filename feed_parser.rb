require 'rubygems'
require 'hpricot'

module Rubyyot
  class FeedParser
    attr_reader :document

    def initialize document_service
      @document = document_service.call
    end

    def parse
      doc = Hpricot.XML(@document)	
      items = []

      (doc/"item").each do |element|
	item = {}
	item[:link] = (element/"link").inner_html
	item[:description] = (element/"description").inner_html
	item[:title] = (element/"title").inner_html
	items << item
      end

      items
    end
  end
end