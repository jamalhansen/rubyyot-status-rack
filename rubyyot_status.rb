class RubyyotStatus
  def call(env)
    require 'rubygems'
    require 'hpricot'
    require 'open-uri'

    text = "<h2>Rubyyot.com is going through changes</h2>"
    text << "<p>If you are looking for my blog you can find it <a href='http://blog.rubyyot.com'>here</a><p>"
    text << "<h3>Latest Updates</h3><ul>"

    css = '<link rel="stylesheet" type="text/css" href="/rubyyot.css" />'
    response_body = "<html><head><title>Rubyyot</title></head>#{css}<body>#{text}"
    status = "200"
    
    begin
      doc = Hpricot.XML(open("http://blog.rubyyot.com/tag/rubyyot/feed/rss"))

      (doc/"item").each do |item|
	link = (item/"link").inner_html
	description = (item/"description").inner_html
	title = (item/"title").inner_html
	response_body << "<li><h4><a href='#{link}'>#{title}<a></h4>#{description}</li>"
      end
    rescue
      status = "500"
    end
    
    response_body << "</ul></body></html>"

    headers = {}
    headers["Content-Length"] = response_body.length.to_s
    headers["Content-Type"] = "text/html"

    [status, headers, response_body]
  end
end

