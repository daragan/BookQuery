class SearchController < ApplicationController

  def search
    @searched_books = params[:searched_value]
    @response_body = HTTParty.get(http://openlibrary.org/api/search?q={@searched_value}&prettyprint=true)
    @parsed_response = JSON.load(@response_body)
  end
end
