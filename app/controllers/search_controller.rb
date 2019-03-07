require 'json'
require 'hashie'
require 'rest-client'
require 'faraday'

class SearchController < ApplicationController
  include HTTParty

  def search
    @searched_book = params[:searched_value]
    @response_body = Faraday.get("https://openlibrary.org/search.json?q=#{@searched_book}")
    @parsed_response = JSON.load(@response_body)
  end


  #def request(:searched_value, params={})
  #  @API_URL = 'https://openlibrary.org'
  #  @request_url = "#{@API_URL}#{:searched_value}"
  #  perform_get_request(@request_url, params)
#  end

#  def search(query, params={})
  #  @API_URL = 'https://openlibrary.org'
  #  @query_url = "#{@API_URL}/query.json?#{query}"
  #  perform_get_request(@query_url, params)
#  end
end
