require 'homepage_builder'

module Rubyyot
  class Homepage
    def call(env)
      response_body = HomepageBuilder.build()
      headers = build_headers_for response_body

      ["200", headers, response_body]
    end

    def build_headers_for body
      headers = {}
      headers["Content-Length"] = body.length.to_s
      headers["Content-Type"] = "text/html"
      headers["Content-Language"] = "en"
      headers
    end
  end
end