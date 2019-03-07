require 'json'
require 'hashie'
require 'rest-client'

class SearchController < ApplicationController
  module Openlibrary
    @API_URL = 'https://openlibrary.org'

    def search(query, params[:searched_value])
      query_url = "#{@API_URL}/query.json?#{query}"
      perform_get_request(query_url, params[:searched_value])
    end


end
